source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Roles authorization
gem 'cancancan'
# Authentication
gem 'devise'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Encoding and decoding of HMACSHA256 tokens
gem 'jwt'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Text progress bar for terminal
gem 'progressbar'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
# Form objects decoupled from your models.
gem 'reform', '~> 2.2.4'
gem 'reform-rails'
# Static ruby code analyzer (linter)
gem 'rubocop', '>= 0.92', require: false
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# A simple, standardized way to build and use Service Objects (aka Commands) in Ruby
gem 'simple_command'
# Rails forms made easy.
gem 'simple_form'
# Use Slim templates
gem 'slim-rails'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Schedule cron jobs
gem 'whenever', require: false

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot'
  gem 'faker'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 4.3'
end

group :development do
  # Checking for N+1 queries
  gem 'bullet'
  # Listens to file modifications and notifies you about the changes.
  gem 'listen', '~> 3.2'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
