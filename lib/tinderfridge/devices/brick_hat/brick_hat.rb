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

      DC  #{'%4.1fV' % [volts[1]*0.001]}
      USB #{'%4.1fV' % [volts[0]*0.001]}
      ET
    end

  end

end
