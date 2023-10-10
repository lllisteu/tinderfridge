module Tinkerforge

  class BrickletParticulateMatter

    # Returns the device's state.
    def state
      super.merge(
        'enabled'          => get_enable,
        'pm_concentration' => get_pm_concentration,
        'pm_count'         => get_pm_count,
        'sensor_info'      => get_sensor_info,
      )
    end

  end

end
