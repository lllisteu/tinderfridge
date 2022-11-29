module Tinkerforge

  class BrickletSegmentDisplay4x7V2

    # Clears the display.
    def clear
      set_segments [false]*8, [false]*8, [false]*8, [false]*8, [false]*2, false
      true
    end

    alias blackout clear

    # Returns the state of all 35 segments.
    def segments
      get_segments.flatten
    end

    # Sets the state of all 35 segments.
    def segments=(*segments)
      segs = segments.flatten
      set_segments segs[0,8], segs[8,8], segs[16,8], segs[24,8], segs[32,2], segs[34]
    end

    # Returns the state of all 35 segments as a string of 1s and 0s.
    def segments_string
      segments.map { |s| s ? '1' : '0' }.join
    end

    # Sets the state of all 35 segments using a string of 1s and 0s.
    #
    # For readability, the string may include spaces and underscores, which will be ignored.
    # @example
    #  my_bricklet.segments_string = '10000110 11000110 11000110 00000110 00 0'
    def segments_string=(segments)
      self.segments = segments.gsub(/[ _]/, '').ljust(35, '0').chars.map { |s| s == '1' }
    end

    # Returns the device's state.
    def state
      super.merge( 'brightness' => get_brightness )
    end

    # Displays a string.
    def print(text='')
      out   = ''
      colon = false

      text.to_s.chars.each do |c|
        if glyphs.key? c
          out << glyphs[c] << '0'
        elsif c == '.' and out[-1] == '0'
          out[-1] = '1'
        elsif c == ':' and out.size == 16
          colon = true
        else
          raise "Can not display '#{text}'"
        end
      end

      self.segments_string = out[0,32].ljust(32,'0') + ( colon ? '110' : '000' )
      nil
    end

    # Returns the definition of glyphs for Unicode chracters.
    def glyphs
      @@glyphs ||= {

        '0' => '1111110',
        '1' => '0110000',
        '2' => '1101101',
        '3' => '1111001',
        '4' => '0110011',
        '5' => '1011011',
        '6' => '1011111',
        '7' => '1110000',
        '8' => '1111111',
        '9' => '1111011',

        'A' => '1110111',
        'b' => '0011111',
        'c' => '0001101',
        'C' => '1001110',
        'd' => '0111101',
        'E' => '1001111',
        'F' => '1000111',
        'G' => '1011110',
        'H' => '0110111',
        'h' => '0010111',
        'I' => '0110000',
        'i' => '0010000',
        'J' => '0111000',
        'L' => '0001110',
        'l' => '0001100',
        'n' => '0010101',
        'O' => '1111110',
        'o' => '0011101',
        'P' => '1100111',
        'q' => '1110011',
        'r' => '0000101',
        'S' => '1011011',
        't' => '0001111',
        'U' => '0111110',
        'u' => '0011100',
        'V' => '0111110',
        'v' => '0011100',
        'y' => '0110011',

        'ö' => '1011101',
        'ü' => '1011100',

        ' ' => '0000000',

        '_' => '0001000',
        '-' => '0000001',
        '¯' => '1000000',
        '=' => '0001001',
        '≡' => '1001001',

        '(' => '1001110',
        ')' => '1111000',

        '[' => '1001110',
        ']' => '1111000',

        '°' => '1100011',

      }
    end

    # Displays an 8-segment bar graph for 1 or 2 values in the range 0..1.
    #
    # @example
    #  my_bricklet.bar_graph 0.5
    #  my_bricklet.bar_graph 0.5, 0.8
    def bar_graph(value1, value2=value1)
      value1, value2 = [value1, value2].map { |v| (v.to_f.clamp(0,1) * 8).round }

      frame = [false] * 35

      [ 5, 1, 13,  9, 21, 17, 29, 25 ].first(value1).each do |n|
        frame[n] = true
      end

      [ 4, 2, 12, 10, 20, 18, 28, 26 ].first(value2).each do |n|
        frame[n] = true
      end

      self.segments = frame
      [value1, value2]
    end

    # Returns the current thread automatically updating the display.
    def thread
      @thread
    end

    # Stops automatic updating of the display.
    def stop
      if thread
        thread.exit
        @thread = nil
      end
    end

    # Continuously displays the current time, in 24-hour format.
    #
    # Starts a new thread automatically updating the display. Use the stop method to end.
    #
    # By default uses local time, or optionally UTC.
    def clock(utc=false)
      stop
      @thread = Thread.new do
        while true
          t = utc ? Time.now.getutc : Time.now
          print t.strftime("%H#{t.sec.even? ? ':' : ''}%M")
          sleep 0.5
        end
      end
    end

  end

end
