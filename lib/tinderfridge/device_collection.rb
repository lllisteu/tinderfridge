module Tinkerforge

  class DeviceCollection < Hash

    # Returns the temperatures as measured inside the microcontrollers of devices in the collection.
    #
    # Nil for devices that do not support the get_chip_temperature method.
    def get_chip_temperature
      smap 'get_chip_temperature'
    end

    # Returns identity information for devices in the collection.
    #
    # Identity information is returned as an array:
    # - 0 : UID
    # - 1 : Connected UID
    # - 2 : Connected port (position)
    # - 3 : Hardware version
    # - 4 : Firmware version
    # - 5 : Device Identifier
    #
    # Nil for devices that do not support the get_identity method.
    def get_identity
      smap 'get_identity'
    end

    # Returns the error counts for devices in the collection.
    #
    # Nil for devices that do not support the get_spitfp_error_count method.
    def get_spitfp_error_count
      smap 'get_spitfp_error_count'
    end

    # Returns the status LED configuration for devices in the collection.
    #
    # Nil for devices that do not support the get_status_led_config method.
    def get_status_led_config
      smap 'get_status_led_config'
    end

    # Sets the status LED configuration for devices in the collection.
    #
    # Ignores devices that do not support the set_status_led_config method.
    #
    # Argument can be an integer (e.g. 0=off, 1=on), or a hash (as returned by #get_status_led_config).
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

    # Prints a list of devices in the collection.
    def ls
      keys.sort_by(&:downcase).each do |k|
        puts "%-8s %.40s" % [k, Tinkerforge.device_info(self[k])[1]]
      end.size
    end

    # Returns the state of devices in the collection.
    def state
      { 'devices' => smap('state') }
    end

    # Turns off light sources such as screens and RGB LEDs for devices in the collection.
    #
    # Ignores devices that do not support the blackout method.
    def blackout
      smap 'blackout'
    end

    # Returns a list of unique IP Connections used by devices in the collection.
    def ipcons
      smap('ipcon').values.compact.uniq
    end

    private

    def smap(m)
      map { |k,d| [ k, d.respond_to?(m) ? d.send(m) : nil ] }.to_h
    end

  end

end
