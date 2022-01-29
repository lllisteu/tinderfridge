require 'tinkerforge/ip_connection'

module Tinkerforge

  ALL_VERSIONS_URL    = 'https://download.tinkerforge.com/all_versions.txt'
  LATEST_VERSIONS_URL = 'https://download.tinkerforge.com/latest_versions.txt'

  class << self

    # Returns the directory where Tinkerforge bindings appear to be installed.
    def lib_dir
      File.dirname File.dirname Device.instance_method('uid').source_location.first
    end

    # Attempts to load all files that are part of Tinkerforge. Returns a list of files loaded.
    def require_everything
      Dir.glob(File.join lib_dir, 'tinkerforge', '*.rb').map do |file|
        require(file) ? file : nil
      end.compact
    end

    # Discovers local devices.
    #
    # Connects to 'localhost', and returns devices discovered there. If no port is specified, defaults to port 4223.
    # @example
    #  Tinkerforge.local.ls
    # @example Mac only
    #  Tinkerforge.local.doc
    def local(port=4223)
      connect('localhost', port).discover(0.25)
    end

  end

end
