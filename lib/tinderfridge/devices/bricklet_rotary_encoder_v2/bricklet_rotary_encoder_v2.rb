module Tinkerforge

  class BrickletRotaryEncoderV2

    # Returns the current count of the encoder.
    def count
      get_count(false)
    end

    # Returns the device's state.
    def state
      super.merge(
        'count'   => count,
        'pressed' => is_pressed,
      )
    end

  end

end
