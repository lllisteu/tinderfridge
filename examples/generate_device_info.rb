# Generates device_info.txt contents.

require 'tinderfridge'

Tinkerforge.require_everything
Tinkerforge::Device.class_map.each { |d| puts d.join("\t") }
