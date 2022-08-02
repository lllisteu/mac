require_relative 'lib/mac/version'

Gem::Specification.new do |s|

  s.name     = 'mac'
  s.summary  = 'Simple Ruby Macintosh integration'
  s.version  = Mac::VERSION

  s.homepage = 'https://github.com/lllisteu/mac'
  s.authors  = [ 'lllist.eu' ]
  s.license  = 'MIT'

  all_files     = `git ls-files -z`.split("\x0")
  s.files       = all_files.grep(%r{^(bin|lib)/})
  s.executables = all_files.grep(%r{^bin/.+}) { |f| File.basename(f) }

  s.required_ruby_version = '>=2.2.0'

  s.metadata = {
    'homepage_uri'      => 'https://github.com/lllisteu/mac',
    'changelog_uri'     => 'https://github.com/lllisteu/mac/blob/master/History.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/mac',
  }

end
