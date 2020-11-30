require 'tinkerforge/ip_connection'

module Tinkerforge
  class Device

    # Returns a programmer-friendly representation of the device.
    def inspect
      if (instance_variable_defined? :@ipcon) and (instance_variable_defined? :@uid_string)
        "%s (%s@%s:%s)" % [self.class, @uid_string, @ipcon.host, @ipcon.port]
      else
        super
      end
    end

    # Identifies a Brick, Bricklet, or other Tinkerforge component by blinking its status led.
    def identify(seconds=10)
      seconds = seconds.to_i
      if (respond_to? 'get_status_led_config') and (respond_to? 'set_status_led_config')
        state = get_status_led_config
        (seconds*2).times do |n|
          set_status_led_config n.remainder(2)
          sleep 0.5
        end
        set_status_led_config state
        seconds
      else
        false
      end
    end

  end
end
