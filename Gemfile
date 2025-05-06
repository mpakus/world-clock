source 'https://rubygems.org'

gem 'bootsnap', require: false
gem 'inertia_rails'
gem 'ostruct'
gem 'pg', '~> 1.1'
gem 'propshaft'
gem 'puma', '>= 5.0'
gem 'rails', '~> 8.0.1'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'vite_rails', '~> 3.0'

group :development, :test do
  gem 'amazing_print'
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'rubocop-rails-omakase', require: false
end

group :development do
  gem 'annotate', github: 'mpakus/annotate_models', branch: 'develop'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
  gem 'ordinare', require: false
  gem 'rubocop', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end

group :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'resque_spec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end
