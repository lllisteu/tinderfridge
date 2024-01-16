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
          safe_send_state('mesh_configuration'  , 'get_wifi2_mesh_configuration'  ), # FW 2.4.2 / 2.1.0
          safe_send_state('mesh_router_ssid'    , 'get_wifi2_mesh_router_ssid'    ), # FW 2.4.2 / 2.1.0
          safe_send_state('mesh_common_status'  , 'get_wifi2_mesh_common_status'  ), # FW 2.4.2 / 2.1.0
          safe_send_state('mesh_client_status'  , 'get_wifi2_mesh_client_status'  ), # FW 2.4.2 / 2.1.0
          safe_send_state('mesh_ap_status'      , 'get_wifi2_mesh_ap_status'      ), # FW 2.4.2 / 2.1.0
          safe_send_state('configuration'       , 'get_wifi2_configuration'       ), # FW 2.4.0
          safe_send_state('status'              , 'get_wifi2_status'              ), # FW 2.4.0
          safe_send_state('client_configuration', 'get_wifi2_client_configuration'), # FW 2.4.0
          safe_send_state('client_hostname'     , 'get_wifi2_client_hostname'     ), # FW 2.4.0
          safe_send_state('ap_configuration'    , 'get_wifi2_ap_configuration'    ), # FW 2.4.0

          if r = safe_send_state('firmware_version', 'get_wifi2_firmware_version' )  # FW 2.4.0
            [ r[0], r[1].join('.') ]
          end
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
