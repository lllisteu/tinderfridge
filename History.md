[← README](README.md) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions)

# History

## Unreleased

* `IPConnection` class:
    * Added `#log_size` method.
    * `#discover` no longer raises an exception when encountering an unknown Device Identifier. It now produces a warning, ignores the unknown device, and continues.
* Bricklet classes:
    * `BrickletColorV2`:
        * Added `#blackout` method.
        * `#state` includes configuration, gain, integration time, color RGBC, illuminance reading, illuminance (lux), color temperature, saturated flag, and status of the white LED.
    * `BrickletMotionDetectorV2`:
        * Added `#blackout` method.
        * `#state` includes motion detected flag, sensitivity, and brightness of indicator lights (backlight).
    * `BrickletVoltageCurrentV2`:
        * `#state` includes voltage, current, power, configuration, and calibration.

## 0.5.0 (12 March 2021)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.5.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.5.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.5.0)

* `IPConnection` class:
    * Added `#localhost?` method.
* `DeviceCollection` class:
    * Added `#find` method.
    * Added `#find_all` method.
* All Brick and Bricklet classes gain:
    * `#device_info` method.
* Bricklet classes:
    * `BrickletAirQuality`:
        * `#state` includes air quality index and -accuracy, temperature, temperature offset, humidity, and air pressure.
    * `BrickletAmbientLightV3`:
        * `#state` includes configuration, illuminance range maximum, integration time, and illuminance reading.
    * `BrickletJoystickV2`:
        * `#state` includes position and button pressed state.
    * `BrickletMotorizedLinearPoti`:
        * Added `#position` method.
        * Added `#position=` method and `#move_to` alias.
        * Added `#lock` method and `#hold` alias.
        * Added `#release` method.
        * `#state` includes position and motor position.
    * `BrickletRemoteSwitchV2`:
        * `#state` includes remote configuration and repeats.
    * `BrickletRGBLEDButton`:
        * `#state` includes color RGB, color calibration, and button pressed state.
    * `BrickletRGBLEDV2`:
        * `#state` includes color RGB.
    * `BrickletRotaryEncoderV2`:
        * Added `#count` method.
        * `#state` includes count and button pressed state.

## 0.4.0 (20 February 2021)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.4.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.4.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.4.0)

* `IPConnection` class:
    * `#discover` takes an optional argument for number of seconds to wait.
* Brick classes:
    * `BrickHAT`:
        * `#state` includes bricklet power, USB voltage, DC voltage, and sleep mode settings.
    * `BrickHATZero`:
        * `#state` includes USB voltage.
* Bricklet classes:
    * `BrickletDMX`:
        * `#state` includes DMX mode, frame duration, frame error count, communication LED config, and error LED config.
    * `BrickletIndustrialDualRelay`:
        * `#state` includes value, connected output, and monoflop state per relay.
    * `BrickletLEDStripV2`:
        * `#state` includes chip type, channel mapping, channels, frame duration, clock frequency, and supply voltage.
    * `BrickletMultiTouchV2`:
        * `#state` includes electrode config and -sensitivity, and touch LED config.
    * `BrickletNFC`:
        * `#state` includes mode, detection LED config, and maximum timeout.
    * `BrickletSegmentDisplay4x7V2`:
        * Added `#print` method.
        * Added `#glyphs` method.
        * Added `#segments=` method.
        * Added `#segments_string` method.
        * Added `#segments_string=` method.
        * `#state` includes current brightness.

## 0.3.0 (18 January 2021)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.3.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.3.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.3.0)

* `DeviceCollection` class:
    * Added `#blackout` method.
    * Added `#ipcons` method.
    * Added `#state` method.
* All Brick and Bricklet classes gain:
    * `#device_display_name` method.
    * `#device_identifier` method.
    * `#uid_string` method.
    * `#state` method.
* Support for new Bricklets:
    * Performance DC Bricklet
    * Servo Bricklet 2.0

## 0.2.0 (29 December 2020)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.2.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.2.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.2.0)

* `IPConnection` class:
    * Improved robustness of `#discover` method.
* `DeviceCollection` class:
    * Added `#get_identity` method.
    * Added `#ls` method.
* Bricklet classes:
    * `BrickletGPSV2` gains:
        * `#coordinates` method.
        * `#time` method.
    * `BrickletLCD128x64` gains:
        * `#backlight` and `#backlight=` methods.
        * `#blackout` method.
        * `#clear` method.
    * `BrickletLEDStripV2` gains:
        * `#blackout` method.
        * `#channels` method.
    * `BrickletOutdoorWeather` gains:
        * `#sensors` method.
    * `BrickletRGBLEDButton` gains:
        * `#rgb` and `#rgb=` methods.
        * `#blackout` method.
    * `BrickletRGBLEDV2` gains:
        * `#rgb` and `#rgb=` methods.
        * `#blackout` method.
    * `BrickletSegmentDisplay4x7V2` gains:
        * `#clear` method and `#blackout` alias.
        * `#segments` method.

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
