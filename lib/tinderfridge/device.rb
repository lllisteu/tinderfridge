require 'tinkerforge/ip_connection'
require 'tinderfridge/shared/logger'

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
        # NOTE: Ruby 3.1 has Class#subclasses
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
            require("tinderfridge/devices/#{info[2][1]}/#{info[2][1]}")
          rescue LoadError
            # No extension found for this device
          end
        end
      end

    end

    #----------------------------------------------------------------------#
    #                           Instance Methods                           #
    #----------------------------------------------------------------------#

    include Tinkerforge::Shared::Logger

    # Returns the device's UID. Not to be confused with #uid, which returns the numeric UID.
    attr_reader :uid_string

    # Returns the device's numeric Device Identifier.
    attr_reader :device_identifier

    # Returns the device's Display Name.
    attr_reader :device_display_name

    # Returns the device's IPConnection object.
    attr_reader :ipcon

    alias original_initialize initialize

    def initialize(uid, ipcon, device_identifier, device_display_name)
      original_initialize(uid, ipcon, device_identifier, device_display_name)
      if respond_to? 'get_identity'
        logger_debug "Created %s '%s'" % [self.class, uid_string]
      end
    end

    # Returns device information.
    #
    # Device information is an array:
    # - 0 : Device Identifier
    # - 1 : Device Display Name
    # - 2 : Associated class name and source file
    def device_info
      Tinkerforge.device_info device_identifier
    end

    # Returns a programmer-friendly representation of the device.
    def inspect
      "#{self.class} (#{uid_string}" + ( ipcon.host ? "@#{ipcon.host}:#{ipcon.port})" : ')' )
    end

    # Returns the device's properties.
    def properties

      # BrickDaemon inherits from Device, but has no #get_identity.
      return {} unless respond_to? 'get_identity'

      identity = get_identity

      @properties ||= [
        [ 'device_identifier'  , device_identifier     ],
        [ 'device_display_name', device_display_name   ],
        [ 'hardware_version'   , identity[3].join('.') ],
      ].compact.to_h.merge load_properties
    end

    alias props properties

    # Returns the device's state.
    def state

      # BrickDaemon inherits from Device, but has no #get_identity.
      return {} unless respond_to? 'get_identity'

      identity = get_identity

      [
        [ 'uid'                , uid_string            ],
        [ 'update_time'        , Time.now.gmtime       ],
        [ 'firmware_version'   , identity[4].join('.') ],

        [ 'connected', { 'uid'  => identity[1], 'position' => identity[2] } ],
        [ 'ipcon'    , { 'host' => ipcon.host , 'port'     => ipcon.port  } ],

        respond_to?('get_chip_temperature'  ) ? [ 'chip_temperature'  , get_chip_temperature   ] : nil,

        if respond_to?('get_spitfp_error_count') and (method(:get_spitfp_error_count).arity == 0)
          [ 'spitfp_error_count', get_spitfp_error_count ]
        else
          nil
        end,

        respond_to?('get_status_led_config' ) ? [ 'status_led_config' , get_status_led_config  ] : nil,

      ].compact.to_h
    end

    # Returns configuration data for the device (a mutable Hash).
    def config
      @config ||= {}
    end

    # Sets configuration data (a Hash) for the device.
    def config=(configuration)
      raise(ArgumentError, 'Invalid configuration') unless configuration.class == Hash
      @config = configuration
    end

    # Opens the online documentation for the device (Mac OS only).
    #
    # When the URL for the documentation is not known, does nothing.
    def open_documentation
      if properties['documentation_en_url'] and ( RUBY_PLATFORM =~ /darwin/ )
        `open #{properties['documentation_en_url']}`
        properties['documentation_en_url']
      else
        nil
      end
    end

    alias doc open_documentation

    # Identifies a Tinkerforge device by blinking its status led.
    #
    # Supports recent devices. When invoked on some older devices, does nothing.
    def identify(seconds=10)
      case status_led_api_variety
      when 1
        seconds = seconds.to_i
        state   = is_status_led_enabled

        (seconds*2).times do |n|
          if n.even?
            disable_status_led
          else
            enable_status_led
          end
          sleep 0.5
        end

        if state
          enable_status_led
        else
          disable_status_led
        end

        seconds
      when 2
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

    private

    def load_properties
      if device_info
        properties_file = File.join(
          File.dirname(__FILE__),
          'devices',
          device_info[2][1],
          device_info[2][1],
        ) + '.json'

        if File.readable? properties_file
          begin
            require 'json'
            JSON.load File.read properties_file
          rescue
            {}
          end
        else
          {}
        end
      else
        {}
      end
    end

    def status_led_api_variety
      @status_led_api_variety ||=
        if ( respond_to?('get_status_led_config') &&
             respond_to?('set_status_led_config') )
          2
        elsif ( respond_to?('is_status_led_enabled') &&
                respond_to?('enable_status_led')     &&
                respond_to?('disable_status_led') )
          1
        else
          nil
        end
    end

  end

end
