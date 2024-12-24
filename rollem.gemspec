Gem::Specification.new do |s|
  s.name = 'rollem'
  s.summary = "Dice roller and nova calculator."
  s.description = "Order-of-Operations compliant. Can read predefined rolls from a file. Interactive session or command line."
  s.version = '2.0.0.beta2'
  s.date = '2024-12-24'
  s.author = 'Eli Harrison'
  s.homepage = 'https://github.com/emh789/rollem'
  s.license = 'GPL-3.0-only'

  s.platform = Gem::Platform::RUBY
  s.files = Dir['bin/*'] + Dir['lib/**/*']
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 3.2'
  s.add_dependency 'colorize', '~> 1.1'
  s.add_dependency 'tty-prompt', '~> 0.23'
  s.executables << 'rollem'
end
