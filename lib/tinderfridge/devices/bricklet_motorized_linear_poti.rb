module Tinkerforge

  class BrickletMotorizedLinearPoti

    # Returns the device's state.
    def state
      super.merge(
        'position'       => get_position,
        'motor_position' => get_motor_position,
      )
    end

  end

end
