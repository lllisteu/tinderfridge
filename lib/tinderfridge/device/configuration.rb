module Tinkerforge
  class Device

    # Returns configuration data for the device (a mutable Hash).
    def config
      @config ||= {}
    end

    # Sets configuration data (a Hash) for the device.
    def config=(configuration)
      raise(ArgumentError, 'Invalid configuration') unless configuration.class == Hash
      @config = configuration
    end

  end
end
