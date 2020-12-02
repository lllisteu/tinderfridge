require 'tinkerforge/version'

module Tinkerforge

  # Returns the directory where Tinkerforge bindings appear to be installed.
  def self.lib_dir
    File.dirname File.dirname const_source_location('VERSION').first
  end

  # Attempts to load all files that are part of Tinkerforge. Returns a list of files loaded.
  def self.require_everything
    Dir.glob(File.join lib_dir, 'tinkerforge', '*.rb').map do |file|
      require(file) ? file : nil
    end.compact
  end

end
