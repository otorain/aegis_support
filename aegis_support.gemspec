require_relative "lib/aegis_support/version"

Gem::Specification.new do |spec|
  spec.name        = "aegis_support"
  spec.version     = AegisSupport::VERSION
  spec.authors     = ["ian"]
  spec.email       = ["ianlynxk@gmail.com"]
  spec.homepage    = "https://github.com/otorain/aegis_support"
  spec.summary     = "A helpful collection of utitility for rails application"
  spec.description = "A helpful collection of utitility for rails application"
    spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 5.0"
  spec.add_development_dependency "rspec-rails", "~> 6.0.0.rc1"
  spec.add_development_dependency "factory_bot_rails", "~> 6.2.0"
  spec.add_development_dependency "faker", "~> 2.20.0"
  spec.add_development_dependency "shoulda-matchers", "~> 5.1.0"
end
