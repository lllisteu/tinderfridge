module Tinkerforge

  class BrickletAirQuality

    # Returns the device's state.
    def state
      av = get_all_values
      super.merge(
        'iaq_index'          => av[0],
        'iaq_index_accuracy' => av[1],
        'temperature'        => av[2],
        'temperature_offset' => get_temperature_offset,
        'humidity'           => av[3],
        'air_pressure'       => av[4],
      )
    end

  end

end
