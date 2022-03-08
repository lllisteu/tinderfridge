[GitHub](https://github.com/lllisteu/tinderfridge) • [RubyGems](https://rubygems.org/gems/tinderfridge) • [Documentation](https://www.rubydoc.info/gems/tinderfridge) • [History](History.md)

# Tinderfridge

A [Ruby](https://www.ruby-lang.org/) library that extends [Tinkerforge](https://www.tinkerforge.com/) in fun and useful ways.

## Installing

Tinderfridge is [available as a gem](https://rubygems.org/gems/tinderfridge). You can simply install it with:

```bash
gem install tinderfridge
```

Tinderfridge has no dependencies outside Tinkerforge and the Ruby Standard Library.

Requirements:

* [Tinkerforge 2.1.28 or newer](https://rubygems.org/gems/tinkerforge).
* Ruby 2.5 or newer.

Older versions of Tinderfridge will work with Tinkerforge 2.1.27 or newer.

## Quick start

Add this line at the beginning of your program (or type in [IRB](https://ruby-doc.org/stdlib/libdoc/irb/rdoc/IRB.html)):

```ruby
require 'tinderfridge'
```

Tinkerforge will work as before, but with some extra powers.

For instance, you can create an [IP Connection](https://www.tinkerforge.com/en/doc/Software/IPConnection_Ruby.html) like this:

```ruby
ipcon = Tinkerforge.connect 'myhost.local'
=> Tinkerforge::IPConnection (myhost.local:4223)
```

Access to [Bricks](https://www.tinkerforge.com/en/doc/Software/Bricks_Ruby.html) and [Bricklets](https://www.tinkerforge.com/en/doc/Software/Bricklets_Ruby.html) is easy:

```ruby
my_devices = ipcon.discover
```

...or combine both steps:

```ruby
my_devices = Tinkerforge.connect('myhost.local').discover
```

Print a list of devices:

```ruby
my_devices.ls
bUt      RGB LED Button Bricklet
PSg      GPS Bricklet 2.0
TaH      HAT Brick
=> 3
```

Get a device's state:

```ruby
my_devices['bUt'].state
=> {"uid"=>"bUt", "update_time"=>2021-07-02 10:55:51 UTC, "firmware_version"=>"2.0.2", "connected"=>{"uid"=>"TaH", "position"=>"d"}, "ipcon"=>{"host"=>"myhost.local", "port"=>4223}, "chip_temperature"=>27, "spitfp_error_count"=>[0, 1, 0, 0], "status_led_config"=>0, "color_rgb"=>[68, 9, 17], "color_calibration"=>[100, 100, 55], "pressed"=>false}
```

Switch off all blue status LEDs:

```ruby
my_devices.set_status_led_config 0
```

Also see the [Tinderfridge documentation](https://www.rubydoc.info/gems/tinderfridge).

## Resources

* Tinkerforge Ruby bindings:
    * [Source on Github](https://github.com/Tinkerforge/generators)
        * [Changelog](https://github.com/Tinkerforge/generators/blob/master/ruby/changelog.txt)
    * [Gem](https://rubygems.org/gems/tinkerforge)
        * [RubyDoc documentation](https://www.rubydoc.info/gems/tinkerforge)
    * [Tinkerforge documentation for Ruby - API bindings](https://www.tinkerforge.com/en/doc/Software/API_Bindings_Ruby.html)

## License

Tinderfridge is licensed under the same terms as the Tinkerforge Ruby bindings.

See the included [LICENSE.txt](LICENSE.txt) file.

-----

<p align=center>
“That which comes after always has a close relationship to what has gone before. For it is not like some enumeration of items separately taken and following a mere inevitable sequence, but there is a rational connection; and just as existing things have been combined into harmonious order, so also all that comes into being bears the stamp not of a mere succession but of a wonderful relationship.”
</p>

<p align=center>
Marcus Aurelius, <i>Meditations</i>, Book IV §45
</p>
