module Tinkerforge

  class BrickletMotorizedLinearPoti

    # Retains the position of the potentiometer. If a position is given, moves to that position first.
    def lock(position=nil)
      set_motor_position( position || get_position, get_motor_position[1], true )
    end

    alias hold lock

    # Releases the potentiometer, so its position can be changed by hand.
    def release
      set_motor_position( get_position, get_motor_position[1], false )
    end

    # Returns the device's state.
    def state
      super.merge(
        'position'       => get_position,
        'motor_position' => get_motor_position,
      )
    end

  end

end
