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
      "TempV2       #{uid_string.rjust 8}\n\n\n" +
      ('%.2f °C' % [get_temperature*0.01]).center(21) +
      (get_heater_configuration == 1 ? "\n\n\n       HEATER" : '')
    end

  end

end
