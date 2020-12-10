module Tinkerforge

  class BrickletRGBLEDV2

    # Returns the LED's current color as three values for red, green, and blue (integers in the range 0..255).
    def rgb
      get_rgb_value
    end

    # Sets the LED's color using three values for red, green, and blue (integers in the range 0..255).
    #
    # Values can be supplied as an array or as three separate values.
    def rgb=(*rgb)
      set_rgb_value *rgb.flatten
    end

  end

end
