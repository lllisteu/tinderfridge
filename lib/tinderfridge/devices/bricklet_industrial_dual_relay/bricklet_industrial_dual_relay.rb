module Tinkerforge

  class BrickletIndustrialDualRelay

    # Returns the device's state.
    def state
      super.merge(
        'relays' => get_value.each_with_index.map do |v,i|
          {
            'value'    => v,
            'output'   => v ? 'A' : 'B',
            'monoflop' => ['time', 'time_remaining'].zip( get_monoflop(i)[1,2] ).to_h,
          }
        end
      )
    end

    # Configures the device by applying settings.
    def configure
      super
      if settings.has_key? 'value'
        set_value *settings['value']
      end
    end

  end

end
