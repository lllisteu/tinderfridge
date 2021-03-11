module Tinkerforge

  class BrickletJoystickV2

    # Returns the device's state.
    def state
      super.merge(
        'position' => get_position,
        'pressed'  => is_pressed,
      )
    end

  end

end
