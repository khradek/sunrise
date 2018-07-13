source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.7'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap-sass'
gem 'sidekiq'
gem 'devise'
gem 'twilio-ruby', '~> 5.10.3'
gem 'local_time'

group :development, :test do 
  gem 'byebug', platform: :mri
end

group :development do  
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'  
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "better_errors"
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]