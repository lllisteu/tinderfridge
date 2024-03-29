require 'tinkerforge/ip_connection'

module Tinkerforge

  ALL_VERSIONS_URL    = 'https://download.tinkerforge.com/all_versions.txt'
  LATEST_VERSIONS_URL = 'https://download.tinkerforge.com/latest_versions.txt'

  class << self

    @@logger = nil

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

    # Assign a Logger object to enable logging of Tinkerforge events.
    def logger=(logger)
      if logger
        if logger.respond_to? :debug
          @@logger = logger
          logger.debug(about)
        else
          raise ArgumentError, 'Invalid Logger'
        end
      else
        @@logger = nil
      end
    end

    # Returns the Logger, or nil
    def logger
      @@logger
    end

    private

    def _view_21x8
      "\n" +
      'Tinkerforge'.center(21) +
      "\n" +
      VERSION.center(21) +
      "\n\n\n\n" +
      "Tinderfridge #{TINDERFRIDGE_VERSION}".center(21) +
      "\n" +
      "Ruby #{RUBY_VERSION}".center(21)
    end

  end

end
