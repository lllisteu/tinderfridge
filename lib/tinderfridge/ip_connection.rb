require 'tinkerforge/ip_connection'

module Tinkerforge

  class IPConnection

    # Returns the host for the IP Connection.
    attr_reader :host

    # Returns the port for the IP Connection.
    attr_reader :port

    # Returns the network socket used by the IP Connection.
    attr_reader :socket

    # Returns a programmer-friendly representation of the object.
    def inspect
      "#{self.class} (%s:%s)" % (host ? [host, port] : ['-', '-'] )
    end

    # Returns the state of the IP Connection.
    def state
      {
        'host'             => host,
        'port'             => port,
        'update_time'      => Time.now.gmtime,
        'connection_state' => get_connection_state,
        'auto_reconnect'   => get_auto_reconnect,
        'timeout'          => get_timeout,
        'log_path'         => log_path,
        'log_size'         => log_size,
      }
    end

    # Returns true if connected to localhost, false if connected via the network.
    def localhost?
      @localhost ||= %w(localhost 127.0.0.1 ::1).include? host
    end

    # Returns the path for the Brick Daemon log file. Nil if connected to Brickd via the network.
    def log_path
      unless defined? @local_log_path
        @local_log_path =
          if localhost?
            if Gem.win_platform?
              'C:\ProgramData\Tinkerforge\Brickd\brickd.log'
            else
              '/var/log/brickd.log'
            end
          else
            nil
          end
      end
      @local_log_path
    end

    # Returns the size (in bytes) of the Brick Daemon log file. Nil if connected to Brickd via the network.
    def log_size
      if log_path
        if File.exist? log_path
          File.size log_path
        else
          0
        end
      else
        nil
      end
    end

    # Returns a Tinkerforge::DeviceCollection with devices discovered for this IP Connection. Discovery may take a few moments.
    #
    # Accepts an optional argument for the number of seconds to wait, otherwise returns immediately.
    #
    # A good idea is to store the result in a variable, which will then be filled with devices as they are found.
    # @example Using Tinkerforge.connect
    #  my_devices = Tinkerforge.connect.discover
    #
    # @example Wait 1 second
    #  Tinkerforge.connect.discover(1).ls
    #
    # @example Classic
    #  ipcon = Tinkerforge::IPConnection.new
    #  ipcon.connect 'localhost', 4223
    #  my_devices = ipcon.discover
    def discover(seconds=nil)
      list = Tinkerforge::DeviceCollection.new

      self.register_callback(CALLBACK_ENUMERATE) do |*args|
        case args[6]
          when 0, 1
            unless list.key?(args[0])
              if dev = device_instance_from_enum_data(args)
                list[args[0]] = dev
              end
            end
          when 2
            list.delete args[0]
        end
      end

      self.enumerate
      sleep(seconds.to_f) if seconds
      list
    end

    # On Mac OS, opens a new Brick Viewer,
    # connected to the IP Connection's host and port.
    #
    # Not supported on other platforms.
    #
    # Requires Brick Viewer version 2.4.23 or later.
    def open_brick_viewer
      if RUBY_PLATFORM =~ /darwin/
        `open -n -a Brickv --args #{host} --port #{port}`
        "#{host}:#{port}"
      end
    end

    alias brickv open_brick_viewer

    private

    # Takes the args supplied by an enumeration callback, and returns a device instance.
    def device_instance_from_enum_data(enum_data)
      if dev_info = Tinkerforge.device_info(enum_data[5])
        require "tinkerforge/#{dev_info[2][1]}"
        Tinkerforge.const_get(dev_info[2][0]).new enum_data[0], self
      else
        warn "Unknown Device Identifier: #{enum_data[5]} (UID: #{enum_data[0]})"
        nil
      end
    end

  end


  class << self

    # Creates an IP Connection object connected to the given host and port.
    #
    # If no host and port are specified, uses the TINKERFORGE_HOST and TINKERFORGE_PORT environment variables, when defined.
    # Otherwise defaults to 'localhost' and port 4223.
    def connect(host=nil, port=nil)
      ipcon = IPConnection.new
      ipcon.connect(
        ( host || ENV['TINKERFORGE_HOST'] || 'localhost' ),
        ( port || ENV['TINKERFORGE_PORT'] ||  4223       )
      )
      ipcon
    end

  end

end
