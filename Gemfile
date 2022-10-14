source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.6'
# Use sqlite3 as the database for Active Record
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'tty-spinner'


# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'active_model_serializers', '~> 0.10.0'



#  https://github.com/tablexi/nucore-open/pull/1578
gem 'ed25519', '>= 1.2', '< 1.3'
 # more info at https://github.com/net-ssh/net-ssh/issues/478
gem "bcrypt_pbkdf", ">= 1.0", "< 2.0"



group :development, :test do

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
gem 'sqlite3', '~> 1.4'
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano'#, '~> 3.15.0', require: false
  gem 'capistrano-rvm'#, require: false
  gem 'capistrano-bundler', '~> 1.5'
  gem 'capistrano-rails', '~> 1.4', require: false
  # gem 'capistrano3-puma', require: false
end

group :production do 
  # gem 'mysql2', '~> 0.3.18'
  gem 'mysql2'
  # gem 'puma', '~> 5.0'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
