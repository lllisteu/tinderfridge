if defined? Tinkerforge
  raise 'Tinkerforge was already loaded, so Tinderfridge can not reliably extend it!'
end

%w(

  version

).each { |m| require "tinderfridge/#{m}" }
