module Tinkerforge

  class BrickletVoltageCurrentV2

    # Returns the device's state.
    def state
      super.merge(
        'voltage'       => get_voltage,
        'current'       => get_current,
        'power'         => get_power,
        'configuration' => get_configuration,
        'calibration'   => get_calibration,
      )
    end

  end

end
