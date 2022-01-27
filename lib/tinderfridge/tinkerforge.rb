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

  end

end
