module Tinkerforge

  class BrickletSolidStateRelayV2

    # Returns the device's state.
    def state
      super.merge(
        'value'    => get_state,
        'monoflop' => get_monoflop,
      )
    end

    private

    def _view_21x8
      "SSRv2        #{uid_string.rjust 8}\n\n" +
      (get_state ? 'On' : 'Off').center(21)
    end

  end

end
