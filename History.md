[← README](README.md) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions)

# History

## Unreleased

* `BrickletGPSV2` gains:
    * `#coordinates` method.
    * `#time` method.
* `BrickletLCD128x64` gains:
    * `#backlight` and `#backlight=` methods.
    * `#clear` method.
* `BrickletLEDStripV2` gains:
    * `#blackout` method.
* `BrickletOutdoorWeather` gains:
    * `#sensors` method.
* `BrickletRGBLEDButton` gains:
    * `#rgb` and `#rgb=` methods.
* `BrickletRGBLEDV2` gains:
    * `#rgb` and `#rgb=` methods.

## 0.1.0 (9 December 2020)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.1.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.1.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.1.0)

* `Tinkerforge` gains:
    * `.connect` method, with useful defaults for `host` and `port`.
    * `.device_info` method.
    * `.lib_dir` method.
    * `.require_everything` method.
    * `.about` method.
* `IPConnection` gains:
    * A terse `#inspect` method.
    * `#host` and `#port` methods.
    * `#discover` method.
* `Device` gains:
    * `.descendants` method.
    * `.class_map` method.
* All Brick and Bricklet classes gain:
    * A terse `#inspect` method.
    * `#ipcon` method.
    * `#identify` method.
* New `DeviceCollection` class:
    * `#get_chip_temperature` method.
    * `#get_spitfp_error_count` method.
    * `#get_status_led_config` method.
    * `#set_status_led_config` method.

## 0.0.0 (23 November 2020)

 * Beginnings of Tinderfridge.
