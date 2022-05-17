module Tinkerforge

  class BrickletBarometerV2

    # Returns the device's state.
    def state
      super.merge(
        'air_pressure'                 => get_air_pressure,
        'calibration'                  => get_calibration,
        'altitude'                     => get_altitude,
        'reference_air_pressure'       => get_reference_air_pressure,
        'temperature'                  => get_temperature,
        'moving_average_configuration' => get_moving_average_configuration,
        'sensor_configuration'         => get_sensor_configuration,
      )
    end

    private

    def _view_21x8
      <<~ET
      Baro         #{uid_string.rjust 8}

          #{'%7.2f hPa' % [get_air_pressure*0.001]}
      ET
    end

  end

end
