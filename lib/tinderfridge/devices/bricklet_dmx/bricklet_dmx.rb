module Tinkerforge

  class BrickletDMX

    # Returns the device's state.
    def state
      super.merge(
        'dmx_mode'                 => get_dmx_mode,
        'frame_duration'           => get_frame_duration,
        'frame_error_count'        => get_frame_error_count,
        'communication_led_config' => get_communication_led_config,
        'error_led_config'         => get_error_led_config,
      )
    end

  end

end
