module Tinkerforge

  class BrickletColorV2

    # Switches off the Bricklet's white LED.
    def blackout
      set_light false
      true
    end

  end

end
