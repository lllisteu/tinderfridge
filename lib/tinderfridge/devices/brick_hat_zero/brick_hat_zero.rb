module Tinkerforge

  class BrickHATZero

    # Returns the device's state.
    def state
      super.merge(
        'usb_voltage' => get_usb_voltage,
      )
    end

  end

end
