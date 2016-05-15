require File.expand_path('../lib/omniauth-contactually/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "Zvi Band"
  gem.email         = "zvi@contactually.com"
  gem.description   = %q{OmniAuth Oauth2 strategy for Contactually.}
  gem.summary       = %q{OmniAuth Oauth2 strategy for Contactually.}
  gem.homepage      = "https://github.com/contactually/omniauth-contactually"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-contactually"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Contactually::VERSION

  gem.add_dependency 'omniauth', '~> 1.1.4'
  gem.add_dependency 'omniauth-oauth2', '~> 1.1.1'
end