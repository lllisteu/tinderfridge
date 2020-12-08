require 'tinkerforge/ip_connection'

module Tinkerforge

  class IPConnection

    # Returns the host for the IP Connection object.
    attr_reader :host

    # Returns the port for the IP Connection object.
    attr_reader :port

    # Returns a programmer-friendly representation of the object.
    def inspect
      "%s (%s:%s)" % [self.class, host, port]
    end

    # Returns a Tinkerforge::DeviceCollection with devices discovered for this IP Connection.
    #
    # Discovery may take a few seconds, but will return a Tinkerforge::DeviceCollection immediately.
    #
    # It is therefore a good idea to store the result in a variable.
    # This variable will be filled with devices as they are found. See examples.
    #
    # @example Using Tinkerforge.connect
    #  my_devices = Tinkerforge.connect.discover
    #
    # @example Classic
    #  ipcon = Tinkerforge::IPConnection.new
    #  ipcon.connect 'localhost', 4223
    #  my_devices = ipcon.discover
    def discover
      list = Tinkerforge::DeviceCollection.new
      self.register_callback(CALLBACK_ENUMERATE) do |*args|
        case args[6]

          when 0, 1  # Available or Connected
            info = Tinkerforge.device_info args[5]
            if info
              require File.join('tinkerforge', info[2][1] )
              list[args.first] = Tinkerforge.const_get( info[2][0] ).new args.first, self
            else     # Device not in device_info
              list[args.first] = nil
            end

          when 2     # Disconnected
            list[args.first] = nil

          else
            raise "Unknown Enumeration Type: #{args[6]}"

        end
      end
      self.enumerate
      list
    end

  end

  # Creates an IP Connection object connected to the given host and port.
  #
  # If no host and port are specified, uses the TINKERFORGE_HOST and TINKERFORGE_PORT environment variables, when defined.
  # Otherwise defaults to 'localhost' and port 4223.
  def self.connect(host=nil, port=nil)
    ipcon = IPConnection.new
    ipcon.connect(
      ( host || ENV['TINKERFORGE_HOST'] || 'localhost' ),
      ( port || ENV['TINKERFORGE_PORT'] ||  4223       )
    )
    ipcon
  end

end
