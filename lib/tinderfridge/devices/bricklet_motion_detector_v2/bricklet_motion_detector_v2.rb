module Tinkerforge

  class BrickletMotionDetectorV2

    # Switches off all three blue backlight LEDs.
    def blackout
      set_indicator(0, 0, 0)
      true
    end

    # Returns the device's state.
    def state
      super.merge(
        'motion_detected' => get_motion_detected == 1,
        'sensitivity'     => get_sensitivity,
        'indicator'       => get_indicator,
      )
    end

  end

end
