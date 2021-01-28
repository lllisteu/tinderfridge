module Tinkerforge

  class BrickletMultiTouchV2

    # Returns the device's state.
    def state
      super.merge(
        'electrode_config'      => get_electrode_config.map { |c| c ? '1' : '0' }.join,
        'electrode_sensitivity' => get_electrode_sensitivity,
        'touch_led_config'      => get_touch_led_config,
      )
    end

  end

end
