module Tinkerforge

  class BrickletLEDStripV2

    # Switches off all connected LEDs. Use in case of misconfiguration or other trouble.
    #
    # Sends the connected LEDs 6144 zeros (2048 RGB values or 1536 RGBW values).
    def blackout
      a = Array.new(1024,0)
      6.times { |n| set_led_values( n*1024, a ) }
      true
    end

  end

end
