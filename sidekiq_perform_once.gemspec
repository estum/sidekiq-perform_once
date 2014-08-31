$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sidekiq-perform_once"
  s.version     = "0.0.5"
  s.authors     = ["Tõnis Simo"]
  s.email       = ["anton.estum@gmail.com"]
  s.homepage    = "https://github.com/estum/sidekiq-perform_once"
  s.summary     = "Sidekiq::PerformOnce"
  s.description = "Perform sidekiq jobs with the same arguments only once."
  
  s.files = Dir["lib/**/*"]
  # s.test_files = Dir["test/**/*"]
  
  s.add_dependency "activesupport", ">= 4", "< 5"
  s.add_dependency "sidekiq", ">= 3", "< 4"
end