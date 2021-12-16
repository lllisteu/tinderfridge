module Tinkerforge

  class BrickletCO2V2

    # Returns the device's state.
    def state
      av = get_all_values
      super.merge(
        'co2_concentration'  => av[0],
        'temperature'        => av[1],
        'temperature_offset' => get_temperature_offset,
        'humidity'           => av[2],
        'air_pressure'       => get_air_pressure,
      )
    end

  end

end
