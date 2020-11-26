require 'tinkerforge/ip_connection'

module Tinkerforge
  class Device

    # Identifies a Brick, Bricklet, or other Tinkerforge component by blinking its status led.
    def identify(seconds=10)
      if (respond_to? 'get_status_led_config') and (respond_to? 'set_status_led_config')
        state = get_status_led_config
        (seconds.to_i*2).times do |n|
          set_status_led_config n.remainder(2)
          sleep 0.5
        end
        set_status_led_config state
      end
    end

  end
end
