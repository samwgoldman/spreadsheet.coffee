require "rspec/expectations"
require "capybara/cucumber"
require "capybara-webkit"
require_relative "../../app"

Capybara.configure do |config|
  config.default_driver = :webkit
  config.app = App
end

Before do
  visit "/index.html"
end
