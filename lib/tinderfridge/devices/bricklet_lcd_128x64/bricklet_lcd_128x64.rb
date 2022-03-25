require 'tinderfridge/shared/display_ibm437_encoding'

module Tinkerforge

  class BrickletLCD128x64

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

    # Returns the current setting for the backlight (0..100).
    def backlight
      get_display_configuration[1]
    end

    # Sets the brightness of the backlight (0..100).
    def backlight=(brightness)
      state = get_display_configuration
      state[1] = brightness.to_i
      set_display_configuration *state
    end

    # Switches off the backlight.
    def blackout
      self.backlight = 0
      true
    end

    # Returns the current contrast setting (0..63).
    def contrast
      get_display_configuration[0]
    end

    # Sets the contrast (0..63).
    def contrast=(value)
      state = get_display_configuration
      state[0] = value.to_i
      set_display_configuration *state
    end

    # Clears the display, including the GUI.
    def clear
      clear_display
      remove_all_gui
    end

    # Returns true if automatic draw is set to false.
    def buffered?
      ! get_display_configuration[3]
    end

    # Draws the currently buffered frame.
    def redraw(force_complete_redraw=false)
      draw_buffered_frame force_complete_redraw
    end

    alias flush redraw

    # Returns the device's state.
    def state
      super.merge(
        'touch_led_config'      => get_touch_led_config,
        'display_configuration' => get_display_configuration,
      )
    end

  end

end
