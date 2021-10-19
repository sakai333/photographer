source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.8'

gem 'rails', '~> 5.2.4', '>= 5.2.4.4'
gem 'bcrypt',         '3.1.13'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rubocop-airbnb'
gem 'carrierwave'
gem 'rmagick'
gem 'dotenv-rails'
gem 'fog-aws'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.6.0'
  gem "factory_bot_rails", "~> 4.10.0"
  # gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers', require: !ENV['SELENIUM_DRIVER_URL']
end

# group :production do
#   gem 'pg'
# end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
