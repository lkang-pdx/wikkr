source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# #1
group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'bonsai-elasticsearch-rails'
end

group :development, :test do
  gem 'pry-rails'
  gem 'faker'
end

# #2
group :development do
  gem 'sqlite3'
  gem 'listen'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'rails-controller-testing'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'simplecov'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

gem 'bootstrap-sass'

gem 'devise'

gem 'figaro', '1.0'

gem 'pundit'

gem 'rolify'

gem 'stripe'

gem 'stripe-ruby-mock', '~> 2.3.1', :require => 'stripe_mock'

gem 'redcarpet'

gem 'elasticsearch-model'

gem 'elasticsearch-rails'
