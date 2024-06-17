module Tinkerforge

  class BrickletAmbientLightV3

    ILLUMINANCE_RANGES = [ 64000, 32000, 16000, 8000, 1300, 600, 100000 ]

    # Returns the device's state.
    def state
      super.merge(
        'configuration'     => conf = get_configuration,
        'illuminance_range' => ILLUMINANCE_RANGES[ conf[0] ],
        'integration_time'  => 50 + conf[1] * 50,
        'illuminance_raw'   => get_illuminance,
      )
    end

    # Configures the device by applying settings.
    def configure
      super
      if settings.has_key? 'configuration'
        set_configuration *settings['configuration']
      end
    end

    private

    def _view_21x8
      s = state
      "AmbiLightV3  #{uid_string.rjust 8}\n\n\n" +
      ("%.2f Lux" % [0.01 * s['illuminance_raw']]).center(21) + "\n\n\n\n" +
      ("max %d / %d ms" % [ s['illuminance_range'], s['integration_time'] ]).center(21)
    end

  end

end
