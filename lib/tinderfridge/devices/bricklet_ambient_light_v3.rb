module Tinkerforge

  class BrickletAmbientLightV3

    ILLUMINANCE_RANGE = [ 64000, 32000, 16000, 8000, 1300, 600, Float::INFINITY ]

    # Returns the device's state.
    def state
      conf = get_configuration

      super.merge(
        'illuminance_max'  => ILLUMINANCE_RANGE[ conf[0] ],
        'integration_time' => 50 + conf[1] * 50,
      )
    end

  end

end
