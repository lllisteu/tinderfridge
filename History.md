[← README](README.md)

# History

## Unreleased

* `Tinkerforge` gains:
    * `.connect` method, with useful defaults for `host` and `port`.
    * `.device_info` method.
    * `.lib_dir` method.
    * `.require_everything` method.
    * `.about` method.
* `Tinkerforge::IPConnection` gains:
    * A terse `#inspect` method.
    * `#host` and `#port` methods.
    * `#discover` method.
* `Tinkerforge::Device` gains:
    * `.descendants` method.
    * `.class_map` method.
* All Brick and Bricklet classes gain:
    * A terse `#inspect` method.
    * `#ipcon` method.
    * `#identify` method.
* Added `Tinkerforge::DeviceCollection` class.

## 0.0.0 (23 November 2020)

 * Beginnings of Tinderfridge.
