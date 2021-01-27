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
      send_request FUNCTION_GET_SEGMENTS, [], '', 14, '?35'
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

  end

end
