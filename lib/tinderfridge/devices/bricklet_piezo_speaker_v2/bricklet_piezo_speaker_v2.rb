module Tinkerforge

  class BrickletPiezoSpeakerV2

    # Beeps briefly.
    #
    # Volume (0..10) defaults to 0.
    def blip(volume=0)
      set_beep(600, volume, 80)
    end

  end

end
