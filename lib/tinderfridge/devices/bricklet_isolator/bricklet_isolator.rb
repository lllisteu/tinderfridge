module Tinkerforge

  class BrickletIsolator

    # Returns the device's state.
    def state
      super.merge(
        'statistics'                  => get_statistics,
        'spitfp_baudrate_config'      => get_spitfp_baudrate_config,
        'spitfp_baudrate'             => get_spitfp_baudrate,
        'isolator_spitfp_error_count' => get_isolator_spitfp_error_count,
      )
    end

  end

end
