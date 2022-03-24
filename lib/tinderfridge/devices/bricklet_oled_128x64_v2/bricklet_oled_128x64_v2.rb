require 'tinderfridge/shared/display_ibm437_encoding'

module Tinkerforge

  class BrickletOLED128x64V2

    include Tinkerforge::Shared::IBM437_encoding

    # Encodes a string in the IBM437 character set used by some displays.
    #
    # Characters that can not be encoded are replaced with '?'.
    #
    # See:
    # - https://en.wikipedia.org/wiki/Code_page_437
    def encode(string)
      ibm437_encode(string)
    end

    # Turns the display all black.
    def blackout
      c = get_display_configuration

      if c[1] # inverted
        set_display_configuration c[0], false, c[2]
      end

      clear_display

      if ! c[2] # buffered
        draw_buffered_frame(true)
      end

      true
    end

    # Returns true if automatic draw is set to false.
    def buffered?
      ! get_display_configuration[2]
    end

    # Draws the currently buffered frame.
    def redraw(force_complete_redraw=false)
      draw_buffered_frame force_complete_redraw
    end

    alias flush redraw

    # Returns the device's state.
    def state
      super.merge(
        'display_configuration' => get_display_configuration,
      )
    end

    # Clears the display and prints upto 8 lines of text.
    #
    # Text may contain newline characters to separate lines.
    # Lines longer than 21 characters will be wrapped.
    #
    # Text is automatically encoded in the IBM437 character set.
    # @example
    #  my_oled.put_screen "Hello, World!\n\nRuby #{RUBY_VERSION}"
    def put_screen(text='', test: false)
      lines = text.split("\n")
      lines = lines.map { |s| s.empty? ? '' : s.scan(/.{1,21}/) }.flatten
      lines = lines[0,8].map { |l| encode l }

      return lines if test

      clear_display
      lines.each_with_index do |s,l|
        write_line l, 0, s
      end
      nil
    end

  end

end
