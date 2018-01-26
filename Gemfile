source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.1'
gem 'hanami-model', '~> 1.1'
gem 'puma',         '3.11.2'
gem 'awesome_print', '1.8.0'

gem 'sqlite3'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
end

group :test, :development do
  gem 'flog', '4.6.1'
  gem 'flay', '2.10.0'
  gem 'reek', '4.7.3'
  gem 'rubocop', '0.52.1'
  gem 'dotenv', '~> 2.0'
  gem 'pry-byebug', '3.5.1'
end

group :test do
  gem 'minitest'
  gem 'capybara'
end
