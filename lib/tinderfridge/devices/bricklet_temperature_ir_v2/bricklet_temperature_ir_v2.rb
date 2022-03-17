module Tinkerforge

  class BrickletTemperatureIRV2

    # Returns the device's state.
    def state
      super.merge(
        'emissivity'  => get_emissivity,
      )
    end

  end

end
