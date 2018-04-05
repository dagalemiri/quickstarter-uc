# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

#gem 'will_paginate', '3.0.pre2'
gem 'will_paginate', '~> 3.1.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem "paperclip", "~> 5.0.0"

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Faker for seeding model
gem 'faker'

gem "figaro"

group :development, :test do
  # Brakeman detects security vulnerabilities in Ruby on Rails
  # applications via static analysis.
  gem 'brakeman', '~> 3.5.0', require: false
  # Call 'byebug' anywhere in the code to stop execution and get a
  # debugger console
  gem 'byebug', platform: :mri
  # Flay analyzes code for structural similarities. Differences in literal
  # values, variable, class, method names, whitespace, programming style,
  # braces vs do/end, etc are all ignored.
  gem 'flay', '~> 2.8.1', require: false
  # A code metric tool for rails codes, written in Ruby.
  gem 'rails_best_practices', '~> 1.18.0', require: false
  # Reek is a tool that examines Ruby classes, modules and
  # methods and reports any code smells it finds.
  gem 'reek', '~> 4.6.1', require: false
  # Automatic Ruby code style checking tool. Aims to enforce
  # the community-driven Ruby Style Guide.
  gem 'rubocop', '~> 0.48.1', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %>
  # anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

ruby '2.4.0'
