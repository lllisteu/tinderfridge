module Tinkerforge

  class DeviceCollection < Hash

    # Returns the temperatures as measured inside the microcontrollers of devices in the collection.
    #
    # Nil for devices that do not support the get_chip_temperature method.
    def get_chip_temperature
      map { |k,d| [ k, d.respond_to?('get_chip_temperature' ) ? d.get_chip_temperature  : nil ] }.to_h
    end

    # Returns the error counts for devices in the collection.
    #
    # Nil for devices that do not support the get_spitfp_error_count method.
    def get_spitfp_error_count
      map { |k,d| [ k, d.respond_to?('get_spitfp_error_count' ) ? d.get_spitfp_error_count  : nil ] }.to_h
    end

    # Returns the status LED configuration for devices in the collection.
    #
    # Nil for devices that do not support the get_status_led_config method.
    def get_status_led_config
      map { |k,d| [ k, d.respond_to?('get_status_led_config') ? d.get_status_led_config : nil ] }.to_h
    end

    # Sets the status LED configuration for devices in the collection.
    #
    # Ignores devices that do not support the set_status_led_config method.
    #
    # Argument can be an Integer (e.g. 0=off, 1=on), or a Hash (as returned by #get_status_led_config).
    def set_status_led_config(state)
      case state
        when Integer
          map { |k,d| d.respond_to?('set_status_led_config') ? d : nil}.compact.each { |d| d.set_status_led_config(state) }.size
        when Hash
          state.keys.select { |k| self[k].respond_to?('set_status_led_config') }.each do |k|
            self[k].set_status_led_config(state[k])
          end.size
        else
          raise ArgumentError, 'Unknown state'
      end
    end

  end

end
