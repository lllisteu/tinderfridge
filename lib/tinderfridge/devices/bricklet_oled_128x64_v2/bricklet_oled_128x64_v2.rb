module Tinkerforge

  class BrickletOLED128x64V2

    # Encodes a string in the IBM437 character set used by the OLED display.
    #
    # Characters that can not be encoded are replaced with '?'.
    #
    # See:
    # - https://en.wikipedia.org/wiki/Code_page_437
    def encode(string)
      string.encode('IBM437', invalid: :replace, undef: :replace)
    end

  end

end
