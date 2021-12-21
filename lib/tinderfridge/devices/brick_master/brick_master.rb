module Tinkerforge

  class BrickMaster

    # Identifies a Master Brick by blinking its status led.
    def identify(seconds=10)
      seconds = seconds.to_i
      state   = is_status_led_enabled

      (seconds*2).times do |n|
        if n.even?
          disable_status_led
        else
          enable_status_led
        end
        sleep 0.5
      end

      if state
        enable_status_led
      else
        disable_status_led
      end

      seconds
    end

  end

end
