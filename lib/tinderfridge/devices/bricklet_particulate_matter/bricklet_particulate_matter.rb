module Tinkerforge

  class BrickletParticulateMatter

    def enable
      set_enable true
    end

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