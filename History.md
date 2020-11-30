[← README](README.md)

# History

## Unreleased

* `Tinkerforge.connect` creates and connects a `Tinkerforge::IPConnection` object, with useful defaults for `host` and `port`.
* `Tinkerforge::IPConnection` class:
    * Gains a terse `#inspect` method.
    * Gains `#host` and `#port` methods.
* All Brick and Bricklet classes:
    * Gain a terse `#inspect` method.
    * Gain an `#ipcon` method.
    * Gain an `#identify` method.
* `Tinkerforge.about` reports Tinkerforge and Tinderfridge versions.

## 0.0.0 (23 November 2020)

 * Beginnings of Tinderfridge.
