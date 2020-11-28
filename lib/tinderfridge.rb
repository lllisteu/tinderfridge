if defined? Tinkerforge
  raise 'Tinkerforge was already loaded, so Tinderfridge can not reliably extend it!'
end

%w(

  version

  ip_connection

  device

).each { |m| require "tinderfridge/#{m}" }