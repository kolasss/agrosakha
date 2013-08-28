source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.13'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem "thin", ">= 1.5.0"
  gem 'pg'
end

group :test do
	gem "capybara", ">= 2.0.3"
	gem "database_cleaner", ">= 1.0.0.RC1"
	gem "email_spec", ">= 1.4.0"
end

group :development do
	gem "html2haml", ">= 1.0.1"
	gem "quiet_assets", ">= 1.0.2"
end

group :development, :test do
	gem "rspec-rails", ">= 2.12.2"
	gem "factory_girl_rails", ">= 4.2.0"
	gem 'sqlite3'
end

gem 'jquery-rails'
gem "haml-rails", ">= 0.4"
gem "bootstrap-sass", ">= 2.3.0.0"
gem "devise", ">= 2.2.3"
gem "cancan", ">= 1.6.9"
gem "rolify", ">= 3.2.0"
gem "simple_form", ">= 2.1.0"

gem 'russian', '~> 0.6.0'
gem "ransack"
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap'
gem 'bootstrap-wysihtml5-rails'
gem 'html_slicer'

gem "paperclip", "~> 3.0"
gem 'aws-sdk'