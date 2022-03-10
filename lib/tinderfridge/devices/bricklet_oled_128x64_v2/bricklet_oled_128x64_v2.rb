module Tinkerforge

  class BrickletOLED128x64V2

    # Encodes a string in the IBM437 character set used by the OLED display.
    #
    # Characters that can not be encoded are replaced with '?'.
    #
    # See:
    # - https://en.wikipedia.org/wiki/Code_page_437
    def encode(string)
      string.encode('IBM437', fallback: encoding_fallback_table)
    end

    private

    # Ruby's IBM437 encoding does not include codepoints 0..31 and 127.
    # This fallback table defines those, minus 0,
    # and defines '?' as default for undefined characters.
    def encoding_fallback_table
      @@encoding_fallback_table ||= Hash.new('?').merge(
        {
          '☺'=> "\x01", '☻'=> "\x02", '♥'=> "\x03", '♦'=> "\x04",
          '♣'=> "\x05", '♠'=> "\x06", '•'=> "\x07", '◘'=> "\x08",
          '○'=> "\x09", '◙'=> "\x0a", '♂'=> "\x0b", '♀'=> "\x0c",
          '♪'=> "\x0d", '♫'=> "\x0e", '☼'=> "\x0f", '►'=> "\x10",
          '◄'=> "\x11", '↕'=> "\x12", '‼'=> "\x13", '¶'=> "\x14",
          '§'=> "\x15", '▬'=> "\x16", '↨'=> "\x17", '↑'=> "\x18",
          '↓'=> "\x19", '→'=> "\x1a", '←'=> "\x1b", '∟'=> "\x1c",
          '↔'=> "\x1d", '▲'=> "\x1e", '▼'=> "\x1f", '⌂'=> "\x7f"
        }
      )
    end

  end

end
