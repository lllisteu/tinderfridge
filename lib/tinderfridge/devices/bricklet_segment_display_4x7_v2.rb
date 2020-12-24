module Tinkerforge

  class BrickletSegmentDisplay4x7V2

    # Clears the display.
    def clear
      set_segments [false]*8, [false]*8, [false]*8, [false]*8, [false]*2, false
    end

    alias blackout clear

    # Returns the state of all 35 segments.
    def segments
      send_request FUNCTION_GET_SEGMENTS, [], '', 14, '?35'
    end

  end

end
