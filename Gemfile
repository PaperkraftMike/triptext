source 'https://rubygems.org'
#ruby-gemset=textme_app

gem 'rails', '4.0.0'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.1.2'
gem 'geocoder'
gem 'twilio-ruby', :require => 'twilio-ruby'
gem 'chronic'
gem 'omnicontacts'
gem 'resque', '1.24.1'
gem 'resque-scheduler', :require => 'resque_scheduler'
gem 'rufus-scheduler'
gem 'mono_logger'

group :development, :test do
  gem 'pg', '0.15.1'
  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.0'
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'growl', '1.0.3'
end

gem 'uglifier', '2.1.1'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'
gem 'haml'
gem 'haml-rails'
gem 'coffee-rails', '4.0.0'
gem 'jquery-rails', '3.0.4'
gem 'sass-rails', '4.0.0'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end
