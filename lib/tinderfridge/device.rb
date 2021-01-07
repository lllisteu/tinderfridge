require 'tinkerforge/ip_connection'

module Tinkerforge
  class Device

    #----------------------------------------------------------------------#
    #                            Class Methods                             #
    #----------------------------------------------------------------------#

    class << self

      # Returns all currently defined classes that inherited from this class.
      #
      # With help from:
      # - https://stackoverflow.com/questions/2393697
      def descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end

      # Returns a map of currently defined device classes.
      def class_map
        descendants.map do |klass|
          if klass.const_defined? 'DEVICE_IDENTIFIER'
            [
              klass.const_get('DEVICE_IDENTIFIER'),
              klass.const_get('DEVICE_DISPLAY_NAME'),
              klass,
              File.basename(klass.instance_method('initialize').source_location.first, '.rb')
            ]
          else
            nil
          end
        end.compact.sort_by { |i| i[0] }
      end

      private

      # Primitive superhook:
      # Every time a class inherits from the Device class,
      # attempts to load an extension for that new class.
      def inherited(klass)
        if info = Tinkerforge.device_info(klass)
          begin
            require("tinderfridge/devices/#{info[2][1]}")
          rescue LoadError
            # No extension found for this device
          end
        end
      end

    end

    #----------------------------------------------------------------------#
    #                           Instance Methods                           #
    #----------------------------------------------------------------------#

    # Returns the device's UID. Not to be confused with #uid, which returns the numeric UID.
    attr_reader :uid_string

    # Returns the device's numeric Device Identifier.
    attr_reader :device_identifier

    # Returns the device's Display Name.
    attr_reader :device_display_name

    # Returns the device's IPConnection object.
    attr_reader :ipcon

    # Returns a programmer-friendly representation of the device.
    def inspect
      "%s (%s@%s:%s)" % [self.class, @uid_string, ipcon.host, ipcon.port]
    end

    # Returns the device's state.
    def state
      [
        [ 'uid'                , uid_string          ],
        [ 'update_time'        , Time.now.gmtime     ],
        [ 'device_identifier'  , device_identifier   ],
        [ 'device_display_name', device_display_name ],

        [ 'ipcon' , { 'host' => ipcon.host, 'port' => ipcon.port } ],

        respond_to?('get_chip_temperature'  ) ? [ 'chip_temperature'  , get_chip_temperature   ] : nil,
        respond_to?('get_spitfp_error_count') ? [ 'spitfp_error_count', get_spitfp_error_count ] : nil,
        respond_to?('get_status_led_config' ) ? [ 'status_led_config' , get_status_led_config  ] : nil,

      ].compact.to_h
    end

    # Identifies a Tinkerforge device by blinking its status led.
    #
    # Supports recent devices. When invoked on older devices, does nothing.
    def identify(seconds=10)
      if (respond_to? 'get_status_led_config') and (respond_to? 'set_status_led_config')
        seconds = seconds.to_i
        state = get_status_led_config

        (seconds*2).times do |n|
          set_status_led_config n.remainder(2)
          sleep 0.5
        end

        set_status_led_config state
        seconds
      else
        false
      end
    end

  end
end
