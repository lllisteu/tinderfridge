module Tinkerforge

  class BrickletParticulateMatter

    # Enables the fan and the laser diode.
    def enable
      set_enable true
    end

    # Disables the fan and the laser diode.
    def disable
      set_enable false
    end

    # Returns the device's state.
    def state
      super.merge(
        'enabled'          => get_enable,
        'pm_concentration' => get_pm_concentration,
        'pm_count'         => get_pm_count,
        'sensor_info'      => get_sensor_info,
      )
    end

    # Configures the device by applying settings.
    def configure
      super
      if settings.has_key? 'enable'
        set_enable( !! settings['enable'] )
      end
    end

    private

    def _view_21x8
      "PM           #{uid_string.rjust 8}\n\n" +
      if get_enable
        "     PM1   %4d\n     PM2.5 %4d\n     PM10  %4d" % get_pm_concentration
      else
        "\n      disabled"
      end
    end

  end

end
