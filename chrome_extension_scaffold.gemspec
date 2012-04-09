# -*- encoding: utf-8 -*-
require File.expand_path('../lib/chrome_extension_scaffold/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Witrant"]
  gem.email         = ["mike@lepton.fr"]
  gem.description   = %q{Generate a scaffold for a chrome extension}
  gem.summary       = %q{Create base files for a chrome extension}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "chrome_extension_scaffold"
  gem.require_paths = ["lib"]
  gem.version       = ChromeExtensionScaffold::VERSION
end
