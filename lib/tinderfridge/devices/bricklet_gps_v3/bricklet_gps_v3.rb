module Tinkerforge

  class BrickletGPSV3

    # Returns the device's state.
    def state
      super.merge(
        'fix_led_config' => get_fix_led_config,
        'fix'            => fix?,
      )
    end

    # Returns true if a fix is available.
    def fix?
      get_status[0]
    end

    # Returns latitude and longitude as reported by the GPS Bricklet.
    #
    # Nil when there is no fix (position not determined).
    def coordinates
      if fix?
        c = get_coordinates
        [
          c[0] / (c[1] == 'N' ? 1000000.0 : -1000000.0),
          c[2] / (c[3] == 'E' ? 1000000.0 : -1000000.0)
        ]
      else
        nil
      end
    end

    # Returns a Time object representing the time as reported by the GPS Bricklet.
    def time
      # FIXME: This will not work after 31-Dec-2099.
      dt = get_date_time.map &:to_s
      dt = dt[0].rjust(6,'0').unpack('a2a2a2').reverse + dt[1].rjust(9,'0').concat('000').unpack('a2a2a2a6')
      dt[0].prepend '20'
      Time.gm *dt.map(&:to_i)
    end

    # Returns a URL for viewing the current coordinates on OpenStreetMap.
    def openstreetmap_marker_url(zoom=12)
      if c = coordinates
        "https://www.openstreetmap.org/?mlat=%f&mlon=%f&zoom=%d" % [c, zoom].flatten
      end
    end

    private

    def _view_21x8
      "GPSV3        #{uid_string.rjust 8}\n\n" +
      ((c = coordinates) ? ("   Lat %10.5f\n   Lon %10.5f" % c) : '       no fix')
    end

  end

end
