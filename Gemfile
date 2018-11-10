source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'loofah', '>= 2.2.3'
gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'rails-i18n'
gem 'uglifier', '>= 1.3.0'
gem 'duktape'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
#gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
gem 'rest-client'
gem 'haml-rails', '~> 1.0'
gem 'devise'
gem 'simple_form'

gem 'mini_magick'

gem 'slim'
gem 'dotenv-rails', groups: [:development, :test]

gem 'bootsnap', '>= 1.1.0', require: false

gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'

#administrate
gem "administrate"
gem 'administrate-field-active_storage'

gem 'sqreen'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'railroady'
  gem 'i18n_yaml_sorter'
end

group :development do
  require 'em/pure_ruby' if Gem.win_platform?
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-bundler'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
