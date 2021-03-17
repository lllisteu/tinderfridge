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

  end

end
