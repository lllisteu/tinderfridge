module Tinkerforge

  class BrickletRGBLEDButton

    # Returns the button's current color as three values for red, green, and blue (integers in the range 0..255).
    def rgb
      get_color
    end

    # Sets the button's color using three values for red, green, and blue (integers in the range 0..255).
    #
    # Values can be supplied as an array or as three separate values.
    def rgb=(*rgb)
      set_color *rgb.flatten
    end

    # Switches off the button's LED.
    def blackout
      self.rgb = 0, 0, 0
      true
    end

  end

end
