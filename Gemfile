source 'https://rubygems.org'

gem 'rails', '3.2.17'
gem 'pg'

gem 'devise'
gem 'twitter-bootstrap-rails', git: 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'jquery-rails'
gem "paper_trail"
gem "less-rails-bootstrap", "~> 2.3.3"
gem 'rails_12factor', group: :production
gem 'jbuilder'
gem 'simple_form'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer', platforms: :ruby
  gem 'execjs'
  gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
  gem 'jquery-ui-rails'
end

group :development, :test do
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"
end

group :test do
  gem "faker", "~> 1.1.2"
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.0.1"
  gem "launchy", "~> 2.3.0"
  gem "selenium-webdriver", "~> 2.35.1"
  gem 'turn'
  gem 'guard-rspec'
  gem 'libnotify'
  gem 'email_spec'
  gem 'rb-fsevent', require: false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-livereload'
end

ruby '2.0.0'
