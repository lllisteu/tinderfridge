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

    # Returns the state of all 35 segments as a string of 1s and 0s.
    def segments_string
      segments.map { |s| s ? '1' : '0' }.join
    end

    # Sets the state of all 35 segments.
    def segments=(*segments)
      segs = segments.flatten
      set_segments segs[0,8], segs[8,8], segs[16,8], segs[24,8], segs[32,2], segs[34]
    end

  end

end
