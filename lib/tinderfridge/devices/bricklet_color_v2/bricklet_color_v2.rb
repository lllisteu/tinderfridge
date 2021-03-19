module Tinkerforge

  class BrickletColorV2

    GAINS = [1, 4, 16, 60]
    INTEGRATION_TIMES = [2.4, 24, 101, 154, 700]

    # Switches off the Bricklet's white LED.
    def blackout
      set_light false
      true
    end

    # Returns the device's state.
    def state
      super.merge(
        'configuration'     => config = get_configuration,
        'gain'              => GAINS[ config[0] ],
        'integration_time'  => INTEGRATION_TIMES[ config[1] ],
        'color_rgbc'        => color = get_color,
        'illuminance_raw'   => illum = get_illuminance,
        'illuminance'       => illum * 700.0 / GAINS[ config[0] ] / INTEGRATION_TIMES[ config[1] ],
        'color_temperature' => get_color_temperature,
        'saturated'         => color[0,3].include?(65535),
        'light'             => get_light,
      )
    end

  end

end
