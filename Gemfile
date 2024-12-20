source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "3.2.2"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "dotenv-rails"
gem "draper"
gem "elasticsearch-model"
gem "elasticsearch-persistence"
gem "elasticsearch-rails"
gem "hashids"
gem "image_processing", "~> 1.2"
gem "importmap-rails"
gem "jbuilder"
gem "jwt"
gem "kredis"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.5"
gem "redis", "~> 5.0"
gem "redis-actionpack"
gem "sassc-rails"
gem "sidekiq"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
gem "whenever", require: false

group :development, :test do
  gem "debug", platforms: %i(mri mingw x64_mingw)
  gem "rubocop", "~> 1.26", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.14.0", require: false
end

group :development do
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
