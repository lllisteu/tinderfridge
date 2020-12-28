module Tinkerforge

  class BrickletLCD128x64

    # Returns the current setting for the backlight (0..100).
    def backlight
      get_display_configuration[1]
    end

    # Sets the brightness of the backlight (0..100).
    def backlight=(brightness)
      state = get_display_configuration
      state[1] = brightness.to_i
      set_display_configuration *state
    end

    # Switches off the backlight.
    def blackout
      self.backlight = 0
      true
    end

    # Clears the display, including the GUI.
    def clear
      clear_display
      remove_all_gui
    end

  end

end
