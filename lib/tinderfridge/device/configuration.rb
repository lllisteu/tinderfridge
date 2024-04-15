module Tinkerforge
  class Device

    # Returns settings for the device (a mutable Hash).
    def settings
      @settings ||= {}
    end

    alias config settings

    # Defines settings for the device (a Hash).
    def settings=(settings_hash)
      raise(ArgumentError, 'Invalid settings') unless settings_hash.class == Hash
      @settings = settings_hash
    end

    alias config= settings=

  end
end
