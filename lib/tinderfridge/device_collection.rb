module Tinkerforge

  class DeviceCollection < Hash

    # Returns the temperatures as measured inside the microcontrollers of devices in the collection.
    #
    # Nil for devices that do not support the get_chip_temperature method.
    #
    # Note: most devices return temperature in °C, but a few return temperature in 1/10 °C.
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

    # Returns the properties of devices in the collection.
    def properties
      smap 'properties'
    end

    alias props properties

    # Returns the state of devices in the collection.
    def state
      smap 'state'
    end

    # Returns configuration data of devices in the collection.
    def config
      smap 'config'
    end

    # Opens the online documentation for the devices in the collection (Mac OS only).
    #
    # When the URL for a device's documentation is not known, does nothing.
    def open_documentation
      smap 'open_documentation'
    end

    alias doc open_documentation

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

    # Returns an array of devices in the collection matching the selector.
    #
    # Selector argument can be:
    # - Device Identifier
    # - Class name or Device Display Name (Regexp)
    # Selection by regular expression is case-insensitive by default.
    #
    # @example Select by class name and Device Display Name
    #  # All 'analog' devices
    #  tf = Tinkerforge.connect.discover(1)
    #  tf.find_all /analog/
    def find_all(selector)
      case selector
        when Integer
          values.select { |v| v.device_identifier == selector}
        when Regexp
          r = Regexp.new selector.source, Regexp::IGNORECASE
          values.select { |v| v.class.to_s.split('::').last =~ r || v.device_display_name =~ r }
      end
    end

    # Returns the first device in the collection matching the selector.
    #
    # Selector argument can be:
    # - Device Identifier
    # - Class name or Device Display Name (Regexp)
    # Selection by regular expression is case-insensitive by default.
    #
    # @example Select by Device Identifier
    #  # Remote Switch Bricklet 2.0
    #  tf = Tinkerforge.connect('myhost.local').discover(1)
    #  tf.find 289
    def find(selector)
      find_all(selector).first
    end

    private

    def smap(m)
      map { |k,d| [ k, ( d.respond_to?(m) and (d.method(m).arity == 0) ) ? d.send(m) : nil ] }.to_h
    end

  end

end
