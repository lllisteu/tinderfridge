module Tinkerforge

  class << self

    # Returns information about device types.
    #
    # Device information is returned as array:
    # - 0 : Device Identifier
    # - 1 : Device Display Name
    # - 2 : Associated class name and source file
    #
    # Optional selector argument can be:
    # - Device Identifier
    # - Device class
    # - Device instance
    # - Class name or Device Display Name (Regexp)
    # Selection by regular expression is case-insensitive by default, and returns an array of matches.
    #
    # @example Select by Device Identifier
    #  Tinkerforge.device_info 2103
    #
    # @example Select by class
    #  Tinkerforge.device_info Tinkerforge::BrickletLEDStripV2
    #
    # @example Select by class name and Device Display Name
    #  # All 'analog' devices
    #  Tinkerforge.device_info /analog/
    #
    #  # Relays and switches
    #  Tinkerforge.device_info /relay|switch/
    #
    # @example No Selector
    #  # All devices
    #  Tinkerforge.device_info
    def device_info(selector=nil)
      @@device_info ||= load_device_info
      case selector
        when NilClass
          @@device_info
        when Integer
          @@device_info.select { |i| i[0] == selector }.first
        when Class
          klass = selector.to_s
          @@device_info.select { |i| i[2][0] == klass }.first
        when Regexp
          r = Regexp.new selector.source, Regexp::IGNORECASE
          @@device_info.select { |i| ( i[1] =~ r ) || ( i[2][0] =~ r ) }
        else
          if selector.class.ancestors.include? Tinkerforge::Device
            klass = selector.class.to_s
            @@device_info.select { |i| i[2][0] == klass }.first
          else
            raise ArgumentError, 'Unsupported selector'
          end
      end
    end

    private

    # Load device info from file.
    def load_device_info
      File.readlines( File.join( File.dirname(__FILE__), 'device_info.txt' ) ).map do |l|
        a = l.chomp.split("\t")
        a[0]   = a[0].to_i
        a[2,2] = a[2,2], nil
        a.compact
      end
    end

  end

end
