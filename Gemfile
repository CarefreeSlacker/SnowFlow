source 'https://rubygems.org'
ruby '1.9.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'
gem 'bcrypt-ruby', '~> 3.1.2'
gem 'bootstrap-sass'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'faker'
gem 'mail'
gem 'thin'
#gem 'safe_attributes'
gem 'actionmailer'

#bootstrap
gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails'

#installing:
# console: rails g bootstrap:install
# console: rails g bootstrap:layout application [fixed]
# gem install commonjs -v 0.2.7
# gem install less -v 2.4.0
# gem install less-rails -v 2.4.2
# gem install libv8 -v 3.16.14.3
# gem install ref -v 1.0.5
# gem install therubyracer -v 0.12.1
# gem install twitter-bootstrap-rails -v 2.2.8
# console: rails g scaffold [name, fields]
# stylesheets/bootstrap and overrides.css.loss + body { padding-top: 60px;}
# console: rails g bootstrap:themed [articles -f]


# additional gem for using sql-queries in ActiveRecord
gem 'arel'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  #gem 'activerecord-jdbcsqlite3-adapter' deleted because i don't use jruby else
  gem 'sqlite3'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 2.8'
  gem 'capybara'
  gem 'webrat', '0.7.3'
end

group :test do
  #gem 'guard-rspec'
end

group :production do
  gem 'pg' #, '0.17.1'
  gem 'rails_12factor'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
