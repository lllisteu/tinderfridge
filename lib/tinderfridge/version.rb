require 'tinkerforge/version'

module Tinkerforge

  # Tinderfridge version.
  TINDERFRIDGE_VERSION = '0.15.2'

  # About Tinkerforge & Tinderfridge.
  def self.about
    "Tinkerforge #{VERSION} (with Tinderfridge #{TINDERFRIDGE_VERSION})"
  end

end
