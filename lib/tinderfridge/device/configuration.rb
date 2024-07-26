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

    # Configures the device by applying settings.
    def configure
      if settings.any?
        logger_debug "Configuring #{settings.keys.map(&:to_s).join(', ')}"
      else
        logger_debug "Configuring (no settings)"
      end
      case status_led_api_variety
        when 2
          if settings.has_key? 'status_led_config'
            set_status_led_config settings['status_led_config'].to_i
          end
        when 1
          if settings.has_key? 'status_led_enabled'
            if !!settings['status_led_enabled']
              enable_status_led
            else
              disable_status_led
            end
          end
      end
    end

  end
end
