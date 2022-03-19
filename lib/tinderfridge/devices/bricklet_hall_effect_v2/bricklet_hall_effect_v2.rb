module Tinkerforge

  class BrickletHallEffectV2

    # Returns the device's state.
    def state
      super.merge(
        'magnetic_flux_density' => get_magnetic_flux_density,
        'counter'               => get_counter(false),
        'counter_config'        => get_counter_config,
      )
    end

  end

end
