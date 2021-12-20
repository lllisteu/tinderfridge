module Tinkerforge

  class BrickletSoundPressureLevel

    WEIGHTINGS = [ 'dB(A)', 'dB(B)','dB(C)', 'dB(D)', 'dB(Z)', 'ITU-R 468']

    # Returns the device's state.
    def state
      super.merge(
        'configuration' => conf = get_configuration,
        'weighting'     => WEIGHTINGS[ conf[1] ],
        'sampling_rate' => 2 ** (3 - conf[0]) * 10,
        'bin_size'      => 2 ** (3 - conf[0]) * 40,
        'decibel'       => get_decibel,
      )
    end

  end

end
