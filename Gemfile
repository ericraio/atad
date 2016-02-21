source 'https://rubygems.org'


gem 'rails', '4.2.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'pg', '~> 0.15'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'whenever', require: false
gem 'unicorn'
gem 'activeadmin', github: 'activeadmin'
gem 'activeadmin-dragonfly', github: 'stefanoverna/activeadmin-dragonfly'
gem 'activeadmin-wysihtml5', github: 'stefanoverna/activeadmin-wysihtml5'
gem 'devise'
gem "aws-ses", "~> 0.6.0", :require => 'aws/ses'
gem 'bower-rails'
gem 'font-awesome-sass', '~> 4.2.0'
gem 'roadie-rails', '1.0.6'
gem 'paper_trail'
gem 'ahoy_email'
gem 'chartkick'
gem 'groupdate'
gem 'ahoy_matey'
gem "queue_classic", "~> 3.0.0"
gem 'meta-tags'

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :production do
  gem 'dotenv-rails', :require => 'dotenv/rails-now'
  gem "skylight"
end
