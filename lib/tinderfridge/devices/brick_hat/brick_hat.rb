module Tinkerforge

  class BrickHAT

    # Returns the device's state.
    def state
      volts = get_voltages
      super.merge(
        'bricklet_power' => get_bricklet_power,
        'usb_voltage'    => volts[0],
        'dc_voltage'     => volts[1],
        'sleep_mode'     => get_sleep_mode,
      )
    end

    private

    def _view_21x8
      volts = get_voltages
      <<~ET
      HAT          #{uid_string.rjust 8}

      USB #{'%5.2f V' % [volts[0]*0.001]}
      DC  #{'%5.2f V' % [volts[1]*0.001]}
      ET
    end

  end

end
