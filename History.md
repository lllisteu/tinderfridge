[← README](README.md)

# History

## Unreleased

* `Tinkerforge.connect` creates and connects a `Tinkerforge::IPConnection` object, with useful defaults for `host` and `port`.
* `Tinkerforge.about` reports Tinkerforge and Tinderfridge versions.
* `Tinkerforge::IPConnection` class:
    * Gains `#host` and `#port` attribute readers.
    * Gains a terse `#inspect` method.
* Devices with a status LED, like Bricks and Bricklets, gain an `#identify` method.

## 0.0.0 (23 November 2020)

 * Beginnings of Tinderfridge.
