# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monthly/version'

Gem::Specification.new do |spec|
  spec.name          = "monthly"
  spec.version       = Monthly::VERSION
  spec.authors       = ["Søren Torp Petersen"]
  spec.email         = ["soeren@borigo.dk"]

  spec.summary       = %q{Find out how many partial months there are between to dates.}
  spec.description   = %q{If you have a monthly subscription of $1 per month, and a customer should pay for a period of 12.1.2015–4.3.2015, you can ask Monthly how many months that corresponds to}
  spec.homepage      = "https://github.com/2rp/monthly/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
