source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0'
gem 'sqlite3'

# Pagination
gem 'kaminari'

# Use SCSS for stylesheets
gem 'sass-rails'

# User Twitter Bootstrap
gem 'bootstrap-sass'

# Create forms
gem 'simple_form'

# Static pages
gem 'high_voltage'

# Encrypted Password
gem 'bcrypt'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# A set of common locale data and translations to internationalize
gem 'rails-i18n', '~> 5.0'

# Monitor
gem 'newrelic_rpm'

# Redis for caching and Action Cable in production
gem 'redis', '~> 3.0'
gem 'redis-rails'

# Taming Rails' Default Request Logging
gem 'lograge'

# dotenv files
gem 'dotenv-rails'

# CORS
gem 'rack-cors', require: 'rack/cors'

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'faker'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails'
  gem 'pry-byebug'
end

group :development do
  gem 'stackprof'
  gem 'flamegraph'
  gem 'rack-mini-profiler'

  # Use Capistrano for deployment
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'airbrussh', require: false

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'selenium-webdriver'
end
