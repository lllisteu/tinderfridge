module Tinkerforge

  class BrickMaster

    # Unit returned by #get_chip_temperature. Master Bricks return temperature as 1/10 °C.
    CHIP_TEMPERATURE_UNIT = 0.1
    # REVIEW: This should ideally be part of base Tinkerforge.

    # Returns the device's state.
    def state
      super.merge [
        safe_send_state('connection_type'   , 'get_connection_type'  ), # FW 2.4.0
        safe_send_state('status_led_enabled', 'is_status_led_enabled'), # FW 2.3.2
      ].compact.to_h
    end

    private

    # Safely call a method for inclusion in state hash.
    # When method blows up, state can ignore it.
    # REVIEW: possible candidate for Device class
    def safe_send_state(key, methot)
      [key, send(methot)]
    rescue => e
      logger_warn "Device '#{uid_string}': '#{methot}' failed. #{e}"
      nil
    end

  end

end
