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
        safe_send_state('chibi_present'     , 'is_chibi_present'     ),
        safe_send_state('rs485_present'     , 'is_rs485_present'     ),
        safe_send_state('wifi_present'      , 'is_wifi_present'      ),
        safe_send_state('ethernet_present'  , 'is_ethernet_present'  ), # FW 2.1.0
        safe_send_state('wifi2_present'     , 'is_wifi2_present'     ), # FW 2.4.0
      ].compact.to_h
    end

    # Returns the state of the WIFI Extension 2.0.
    def wifi2_state
      if is_wifi2_present
        [
          # Draft generated with:
          # methods.grep(/^get_wifi2_/).map(&:to_s).map { |m| "          safe_send_state('%s', '%s'),\n" % [m.sub(/^get_wifi2_/, ''), m] }.join
          safe_send_state('mesh_configuration', 'get_wifi2_mesh_configuration'),
          safe_send_state('mesh_router_ssid', 'get_wifi2_mesh_router_ssid'),
          safe_send_state('mesh_router_password', 'get_wifi2_mesh_router_password'),
          safe_send_state('mesh_common_status', 'get_wifi2_mesh_common_status'),
          safe_send_state('mesh_client_status', 'get_wifi2_mesh_client_status'),
          safe_send_state('mesh_ap_status', 'get_wifi2_mesh_ap_status'),
          safe_send_state('authentication_secret', 'get_wifi2_authentication_secret'),
          safe_send_state('configuration', 'get_wifi2_configuration'),
          safe_send_state('status', 'get_wifi2_status'),
          safe_send_state('client_configuration', 'get_wifi2_client_configuration'),
          safe_send_state('client_hostname', 'get_wifi2_client_hostname'),
          safe_send_state('client_password', 'get_wifi2_client_password'),
          safe_send_state('ap_configuration', 'get_wifi2_ap_configuration'),
          safe_send_state('ap_password', 'get_wifi2_ap_password'),
          safe_send_state('firmware_version', 'get_wifi2_firmware_version'),
        ].compact.to_h
      end
    rescue
        nil
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
