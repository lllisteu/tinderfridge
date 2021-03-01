module Tinkerforge

  class BrickletRemoteSwitchV2

    # Returns the device's state.
    def state
      super.merge(
        'remote_configuration' => get_remote_configuration,
        'repeats'              => get_repeats,
      )
    end

  end

end
