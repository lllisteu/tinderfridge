require 'tinkerforge/ip_connection'

module Tinkerforge

  class IPConnection

    attr_reader :host, :port

    def inspect
      "%s (%s:%s)" % [self.class, host, port]
    end

  end

  # Creates an IP Connection object connected to the given host and port.
  #
  # If no host and port are specified, uses the TINKERFORGE_HOST and TINKERFORGE_PORT environment variables, when defined.
  # Otherwise defaults to 'localhost' and port 4223.
  def self.connect( host = (ENV['TINKERFORGE_HOST'] || 'localhost'), port = (ENV['TINKERFORGE_PORT'] || 4223) )
    ipcon = IPConnection.new
    ipcon.connect host, port
    ipcon
  end

end
