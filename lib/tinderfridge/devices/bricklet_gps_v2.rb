module Tinkerforge

  class BrickletGPSV2

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
