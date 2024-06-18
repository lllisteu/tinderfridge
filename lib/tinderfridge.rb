if defined? Tinkerforge
  raise 'Tinkerforge was already loaded, so Tinderfridge can not reliably extend it!'
end

require 'tinderfridge/version'
require 'tinderfridge/ip_connection'
require 'tinderfridge/device'
require 'tinderfridge/tinkerforge'
require 'tinderfridge/device_info'
require 'tinderfridge/device_collection'
