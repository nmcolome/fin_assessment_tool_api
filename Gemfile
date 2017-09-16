source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'active_model_serializers', '~> 0.10.0'
gem 'rack-cors', :require => 'rack/cors'
# gem 'bcrypt', '~> 3.1.7'
# gem 'rack-cors'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.6'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'faker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
