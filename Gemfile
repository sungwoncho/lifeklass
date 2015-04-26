source 'https://rubygems.org'
ruby '2.2.1'

gem 'rails', '4.2.1'
gem 'pg'

group :production do
  gem 'puma'
  gem 'rails_12factor'
end

# LifeKlass App Engines
gem 'courses', path: 'engines/courses'
gem 'mentors', path: 'engines/mentors'
gem 'users', path: 'engines/users'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails', '~> 3.2.1'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'powder'
  gem 'pry-rails'
  gem 'spring-commands-rspec'
  gem 'pry-remote'
end

group :test do
  gem 'database_cleaner', '~> 1.4.1'
  gem 'shoulda-matchers'
end

group :production, :test do
  gem 'faker', '~> 1.4.3'
end

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'haml', '~> 4.0.6'
gem 'haml-rails', '~> 0.9'
gem 'devise', '~> 3.4.1'
gem 'simple_form'
gem 'will_paginate', '~> 3.0.7'
gem 'draper', '~> 2.1.0'
gem 'will_paginate-bootstrap', '~> 1.0.1'
gem 'pundit', '~> 1.0.0'
gem 'gretel', '~> 3.0.8'
