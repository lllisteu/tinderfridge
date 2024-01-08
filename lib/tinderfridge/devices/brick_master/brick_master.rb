module Tinkerforge

  class BrickMaster

    # Unit returned by #get_chip_temperature. Master Bricks return temperature as 1/10 °C.
    CHIP_TEMPERATURE_UNIT = 0.1
    # REVIEW: This should ideally be part of base Tinkerforge.

    # Returns the device's state.
    def state
      super.merge [
        respond_to?('get_connection_type'  ) ? ['connection_type'  , get_connection_type] : nil,
      ].compact.to_h
    end

  end

end
