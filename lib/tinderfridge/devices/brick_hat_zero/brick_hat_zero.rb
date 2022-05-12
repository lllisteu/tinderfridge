module Tinkerforge

  class BrickHATZero

    # Returns the device's state.
    def state
      super.merge(
        'usb_voltage' => get_usb_voltage,
      )
    end

    private

    def _view_21x8
      <<~ET
      HAT Zero     #{uid_string.rjust 8}

      USB #{'%5.2f V' % [get_usb_voltage*0.001]}
      ET
    end

  end

end
