source "https://rubygems.org"

gem "rails", "~> 8.0.1"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "turbo-rails"
gem "stimulus-rails"
gem 'inertia_rails'
gem "vite_rails", "~> 3.0"
gem "bootsnap", require: false
gem 'ostruct'

group :development, :test do
  gem 'amazing_print'
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  gem 'foreman'
  gem 'annotate', github: 'mpakus/annotate_models', branch: 'develop'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'ordinare', require: false
  gem 'rubocop', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'resque_spec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end
