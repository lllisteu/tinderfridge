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

  end

end
