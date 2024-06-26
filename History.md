[← README](README.md) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions)

# History

## 0.16.0 (14 Apr 2024)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.16.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.16.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.16.0)

* Added support for the new Industrial Dual AC In Bricklet.
* Tweaked layout of various log messages.
* Bricklet classes:
    * `BrickletSegmentDisplay4x7V2`:
        * Fixed a bug with handling unprintable characters.
* `IPConnection`:
    * `#connect` now logs elapsed time.
        
## 0.15.0 (6 Feb 2024)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.15.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.15.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.15.0)

* `DeviceCollection`:
    * Added `#devices` alias for `#values`.
    * `#disconnect` now removes all devices from the collection.
* All Brick and Bricklet classes:
    * `#properties` includes hardware version.
* `BrickMaster`:
    * `#state` includes (if supported by firmware):
        * Connection type and status led enablement.
        * Presence of extensions (chibi, rs485, ethernet, wifi, wifi2).
    * Added `#wifi2_state`.
* Bricklet classes:
    * `BrickletParticulateMatter`:
        * Added `#disable` and `#enable` methods.
        * `#state` includes enablement, pm-concentration, pm-count, and sensor info.
    * `BrickletSegmentDisplay4x7V2`:
        * Added `#all_on` method.
        * Added (B, N, Y) and refined (y) printable glyphs.
* `IPConnection`:
    * Connecting to and disconnecting from a host are logged (when event logging is enabled).

## 0.14.0 (31 Jan 2023)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.14.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.14.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.14.0)

Introduces the possibility to log events to a `Logger` instance:

* Tinkerforge gains `.logger=` and `.logger` methods.
* `IPConnection#discover` logs enumeration events.
* All Brick and Bricklet classes log creation of new instances.

Other changes:

* All Brick and Bricklet classes:
    * Refined `#inspect` a bit.
* `DeviceCollection` and all Brick and Bricklet classes:
    * Added `#config=` method.
*  `DeviceCollection` class:
    * Added `#disconnect` method.
* `IPConnection`:
    * Refined `#inspect` somewhat.
    * Fixed: `#open_brick_viewer` checks for `host`.

## 0.13.0 (21 Dec 2022)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.13.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.13.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.13.0)

*  `DeviceCollection` and `IPConnection` classes:
    * Added `#open_brick_viewer` method and `#brickv` alias.
* `DeviceCollection` and all Brick and Bricklet classes:
    * Added `#config` method.
* Bricklet classes:
    * `BrickletLCD128x64` and `BrickletOLED128x64V2`:
        * Improved `#show` method.
    * `BrickletOutdoorWeather`:
        * `#sensors` supports configurable sensor-mapping.
    * `BrickletSegmentDisplay4x7V2`:
        * Added `#clock` method.
        * Added `#stop` and `#thread` methods.
        * Added ¯ (macron) and ≡ (triple bar) to the printable glyphs.
    * `BrickletSolidStateRelayV2`:
        * `#state` includes relay state (value) and monoflop state.

## 0.12.0 (22 Jul 2022)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.12.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.12.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.12.0)

* Bricklet classes:
    * `BrickletGPSV3`:
        * Added `#fix?` method.
        * Added `#coordinates` method.
        * Added `#time` method.
        * Added `#openstreetmap_marker_url` method.
        * `#state` includes fix availability and fix LED configuration.
    * `BrickletOutdoorWeather`:
        * `#state` includes sensor data.
    * `BrickletPiezoSpeakerV2`:
        * Added `#blip` method.

## 0.11.0 (24 May 2022)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.11.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.11.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.11.0)

* Added support for new devices:
    * ESP32 Brick
    * ESP32 Ethernet Brick
    * GPS Bricklet 3.0
* Bricklet classes:
    * `BrickletBarometerV2`:
        * `#state` includes air pressure, calibration, altitude, reference air pressure, temperature, moving average configuration, and sensor configuration.
    * `BrickletLCD128x64`:
        * Added `#put_screen` method.
        * Added `#show` method.
    * `BrickletOLED128x64V2`:
        * Added `#show` method.
    * `BrickletTemperatureV2`:
        * `#state` includes temperature and heater configuration.

## 0.10.0 (4 April 2022)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.10.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.10.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.10.0)

* `Tinkerforge` gains:
    * `.local` method.
* `IPConnection` class:
    * Added `#socket` method.
* Bricklet classes:
    * `BrickletAirQuality`:
        * Added `#qff` method.
    * `BrickletGPSV2`:
        * Added `#openstreetmap_marker_url` method.
    * `BrickletHallEffectV2`:
        * `#state` includes magnetic flux density, counter, and counter configuration.
    * `BrickletLCD128x64`:
        * Added `#encode` method.
        * Added `#contrast` and `#contrast=` methods.
        * Added `#buffered?` method.
        * Added `#redraw` method and `#flush` alias.
        * `#state` includes touch led- and display configuration.
    * `BrickletOLED128x64V2`:
        * Added `#encode` method.
        * Added `#put_screen` method.
        * Added `#buffered?` method.
        * Added `#redraw` method and `#flush` alias.
        * Added `#blackout` method.
        * `#state` includes display configuration.
    * `BrickletTemperatureIRV2`:
        * `#state` includes emissivity.
* Added properties for various Bricklets.

## 0.9.0 (26 January 2022)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.9.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.9.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.9.0)

* Bricklet classes:
    * `BrickletCO2V2`:
        * `#state` includes CO2 concentration, temperature, temperature offset, humidity, and air pressure.
    * `BrickletGPSV2`:
        * Added `#fix?` method.
        * `#state` includes fix availability and fix LED configuration.
    * `BrickletSegmentDisplay4x7V2`:
        * Added ° (degree symbol) to the printable glyphs.
    * `BrickletSoundPressureLevel`:
        * `#state` includes configuration, weighting, sampling rate, bin size, and sound pressure.
* `#identify` works on more devices, including Master Bricks.
* Added properties for various Bricks and Bricklets.
* Fixed: calling `#state` on a `BrickMaster` instance no longer raises an exception.

## 0.8.0 (17 August 2021)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.8.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.8.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.8.0)

* Requires Tinkerforge bindings 2.1.28 or later.
* Bricklet classes:
    * `BrickletSegmentDisplay4x7V2`:
        * Added `#bar_graph` method.
        * Removed workaround for bug in Tinkerforge bindings < 2.1.28.
    * Added properties for various Bricklets.

## 0.7.0 (19 May 2021)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.7.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.7.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.7.0)

* `IPConnection` class:
    * Added `#log_path` method.
    * `#state` includes update time and log_path.
* Bricklet classes:
    * Added properties for various Bricklets.
* Support for new Bricklets:
    * Added support for:
        * DC Bricklet 2.0
        * Industrial PTC Bricklet
        * Silent Stepper Bricklet 2.0
    * Note: the _Industrial Dual AC Relay Bricklet_ already is supported starting with version 0.0.1.
* Fixed: calling `#state` on a `BrickDaemon` instance no longer raises an exception.

## 0.6.0 (2 April 2021)
[GitHub](https://github.com/lllisteu/tinderfridge/releases/tag/v0.6.0) • [RubyGems](https://rubygems.org/gems/tinderfridge/versions/0.6.0) • [Documentation](https://www.rubydoc.info/gems/tinderfridge/0.6.0)

* `IPConnection` class:
    * Added `#log_size` method.
    * Added `#state` method.
    * `#discover` no longer raises an exception when encountering a device with an unknown Device Identifier. It now produces a warning, ignores the unknown device, and continues.
* `DeviceCollection` class:
    * Added `#properties` method and `#props` alias.
    * Added `#open_documentation` method and `#doc` alias.
* All Brick and Bricklet classes:
    * Added `#properties` method and `#props` alias.
    * Removed Device Identifier and Device Display Name from `#state`. Both were added to `#properties`.
    * Added `#open_documentation` method and `#doc` alias.
* Bricklet classes:
    * `BrickletColorV2`:
        * Added `#blackout` method.
        * `#state` includes configuration, gain, integration time, color RGBC, illuminance reading, illuminance (lux), color temperature, saturated flag, and status of the white LED.
    * `BrickletIsolator`:
        * `#state` includes statistics, spitfp baudrate configuration, spitfp baudrate, and isolator spitfp error count.
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
