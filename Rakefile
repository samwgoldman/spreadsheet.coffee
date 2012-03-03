require 'bundler'
Bundler.setup

require 'jasmine-headless-webkit'

Jasmine::Headless::Task.new('js') do |t|
  t.colors = true
  t.keep_on_error = true
  t.jasmine_config = 'spec/javascripts/support/jasmine.yml'
end

task :default => :js
