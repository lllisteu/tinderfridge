module Tinkerforge

  class BrickletGPSV2

    # Returns latitude and longitude as reported by the GPS Bricklet.
    #
    # Nil when there is no fix (position not determined).
    def coordinates
      if get_status[0]
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

  end

end
