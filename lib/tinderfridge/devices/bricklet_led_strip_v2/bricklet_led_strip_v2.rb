module Tinkerforge

  class BrickletLEDStripV2

    # Switches off all connected LEDs. Use in case of misconfiguration or other trouble.
    #
    # Sends the connected LEDs 6144 zeros (2048 RGB values or 1536 RGBW values).
    def blackout
      a = Array.new(1024,0)
      6.times { |n| set_led_values( n*1024, a ) }
      true
    end

    # Returns the channels as defined by the channel mapping.
    def channels
      if ch = lookup_channel_mapping(get_channel_mapping)
        ch[1].chars
      else
        ch
      end
    end

    # Returns the device's state.
    def state
      super.merge(
        'chip_type'       => get_chip_type,
        'channel_mapping' => get_channel_mapping,
        'channels'        => channels,
        'frame_duration'  => get_frame_duration,
        'clock_frequency' => get_clock_frequency,
        'supply_voltage'  => get_supply_voltage,
      )
    end

    # Configures the device by applying settings.
    def configure
      super

      if settings.has_key? 'chip_type'
        if settings['chip_type'].to_i != get_chip_type
          set_chip_type settings['chip_type'].to_i
        end
      end

      if settings.has_key? 'channel_mapping'
        set_channel_mapping settings['channel_mapping'].to_i
      end

      if settings.has_key? 'frame_duration'
        set_frame_duration settings['frame_duration'].to_i
      end

      if settings.has_key? 'clock_frequency'
        if settings['clock_frequency'].to_i != get_clock_frequency
          set_clock_frequency settings['clock_frequency'].to_i
        end
      end
    end

    private

    def lookup_channel_mapping(selector=nil)
      @@channel_mapping_table ||= self.class.constants.map do |c|
        (c.to_s =~ /^CHANNEL_MAPPING_(\w{3,4})$/ ) ? [self.class.const_get(c), $1] : nil
      end.compact.sort_by { |l| l[0] }
      case selector
        when NilClass
          @@channel_mapping_table
        when Integer
          @@channel_mapping_table.select { |n,s| n == selector }.first
        when String
          @@channel_mapping_table.select { |n,s| s == selector }.first
        else
          raise ArgumentError, 'Unknown selector'
      end
    end

  end

end
