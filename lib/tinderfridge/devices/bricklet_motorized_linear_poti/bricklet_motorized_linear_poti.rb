module Tinkerforge

  class BrickletMotorizedLinearPoti

    # Returns the position of the potentiometer (an integer in the range 0..100).
    def position
      get_position
    end

    # Moves the potentiometer to the given position.
    #
    # If the potentiometer was locked before, it will be locked at the new position.
    # The drive mode (speed) will be the same as the last time the position was set.
    def position=(position)
      set_motor_position( position, *get_motor_position[1,2] )
    end

    alias move_to position=

    # Locks the position of the potentiometer. If a position is given, moves to that position first.
    def lock(position=nil)
      set_motor_position( position || get_position, get_motor_position[1], true )
    end

    alias hold lock

    # Releases the potentiometer, so its position can be changed by hand. If a position is given, moves to that position first.
    def release(position=nil)
      set_motor_position( position || get_position, get_motor_position[1], false )
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
