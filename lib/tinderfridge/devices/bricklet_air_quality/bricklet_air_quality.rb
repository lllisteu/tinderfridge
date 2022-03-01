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

    # Returns the derived air pressure at sea level.
    #
    # Air pressure is derived from:
    # - air pressure as measured by the Bricklet itself
    # - temperature as measured by the Bricklet itself
    # - altitude of the Bricklet's location (meter)
    #
    # With help from:
    # - https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Barometer_V2.html
    # - https://keisan.casio.com/exec/system/1224575267
    def qff(altitude)
    # QFE / [1 - Tg * H / (273.15 + Tfe + Tg * H)] ^ (0.034163 / Tg)
      (get_air_pressure / (1 - 0.0065 * altitude / (273.15 + (get_temperature * 0.01) + 0.0065 * altitude)) ** (0.034163 / 0.0065)).round
    end

  end

end
