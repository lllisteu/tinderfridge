require_relative 'lib/tinderfridge/version'

Gem::Specification.new do |s|

  s.name     = 'tinderfridge'
  s.summary  = 'Extending Tinkerforge in fun and useful ways.'
  s.version  = Tinkerforge::TINDERFRIDGE_VERSION

  s.homepage = 'https://github.com/lllisteu/tinderfridge'
  s.authors  = [ 'lllist.eu' ]
  s.license  = 'CC0-1.0'

  all_files  = `git ls-files -z`.split("\x0")
  s.files    = all_files.grep(%r{^lib/})

  s.required_ruby_version = '>=2.5.0'

  s.add_runtime_dependency( 'tinkerforge', '~> 2.1', '>= 2.1.27' )

  s.metadata = {
    'homepage_uri'      => 'https://github.com/lllisteu/tinderfridge',
    'changelog_uri'     => 'https://github.com/lllisteu/tinderfridge/blob/master/History.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/tinderfridge',
  }

end
