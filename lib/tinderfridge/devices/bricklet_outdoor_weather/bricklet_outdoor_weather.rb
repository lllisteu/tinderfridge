module Tinkerforge

  class BrickletOutdoorWeather

    # Returns the device's state.
    def state
      super.merge(
        'sensor_data' => sensors,
      )
    end

    # Returns the last measured data for all sensors.
    #
    # The result is a Hash, with sensor identifiers as the keys. Values per sensor are:
    # - 0: Temperature (°C)
    # - 1: Relative humidity (%RH)
    # - 2: Last change (seconds)
    def sensors
      get_sensor_identifiers.map do |id|
        [ id, get_sensor_data(id).each_with_index.map { |v,i| i == 0 ? v/10.0 : v } ]
      end.to_h
    end

    private

    def _view_21x8
      "Weather      #{uid_string.rjust 8}\n\n" +
      sensors.first(6).map do |k,v|
        %Q(#{v[2] > 100 ? '!' : ' '}%-8.8s %5.1f°C%3d%%\n) % [k,v].flatten
      end.join
    end

  end

end
