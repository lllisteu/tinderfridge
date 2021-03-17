module Tinkerforge

  class BrickletNFC

    # Returns the device's state.
    def state
      super.merge(
        'mode'                 => get_mode,
        'detection_led_config' => get_detection_led_config,
        'maximum_timeout'      => get_maximum_timeout,
      )
    end

  end

end
