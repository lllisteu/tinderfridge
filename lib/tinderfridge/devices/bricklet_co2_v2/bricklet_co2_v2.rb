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

    private

   def _print_4
      if (co2 = get_co2_concentration) > 9999
        ' ol '
      else
        '%4d' % co2
      end
    end

    def _view_21x8
      "CO2V2        #{uid_string.rjust 8}\n\n\n" +
      ('%d PPM' % get_co2_concentration).center(21)
    end

  end

end
