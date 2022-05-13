module Tinkerforge

  class BrickletTemperatureV2

    # Returns the device's state.
    def state
      super.merge(
        'temperature'          => get_temperature,
        'heater_configuration' => get_heater_configuration,
      )
    end

    private

    def _view_21x8
      <<~ET
      Temp         #{uid_string.rjust 8}

            #{'%6.2f °C' % [get_temperature*0.01]}

              #{get_heater_configuration == 1 ? 'HEATER' : ''}
      ET
    end

  end

end
