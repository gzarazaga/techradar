source "https://rubygems.org"
ruby "2.1.2"

gem "rails", "4.2.0"

gem "airbrake"
gem "analytics-ruby", "~> 2.0.0", require: "segment/analytics"
gem "bootstrap-sass"
gem "coffee-rails", "~> 4.1.0"
gem "devise"
gem "draper"
gem "friendly_id"
gem "haml-rails"
gem "jbuilder", "~> 2.0"
gem "jquery-rails"
gem "pg"
gem "rack-timeout" # https://devcenter.heroku.com/articles/rails-unicorn#rack-timeout
gem "responders", github: "plataformatec/responders" # waiting for official 4.2 support
gem "sass-rails", "~> 5.0"
# bundle exec rake doc:rails generates the API under doc/api.
gem "sdoc", "~> 0.4.0", group: :doc
gem "sendgrid"
gem "select2-rails"
gem "simple_form", github: "plataformatec/simple_form", branch: "master"
gem "turbolinks"
gem "uglifier", ">= 1.3.0"
gem "unicorn"
gem "wisper"

group :development do
  gem "foreman"
  gem "letter_opener"
  gem "quiet_assets"
  gem "rails_layout"
  gem "rails_stdout_logging"
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "capybara-email", "~> 2.4"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "haml-lint"
  gem "launchy"
  gem "pry"
  gem "pry-byebug"
  gem "pry-rescue"
  gem "pry-stack_explorer"
  gem "quality"
  gem "rspec-rails"
  gem "rubocop-rspec"
  gem "shoulda-matchers", require: false
end

group :test do
  gem "capybara"
  gem "codeclimate-test-reporter", require: false
  gem "database_cleaner", "1.0.1"
  gem "rspec_junit_formatter", git: "git@github.com:circleci/rspec_junit_formatter.git" # for CircleCI
  gem "rspec-activemodel-mocks"
  gem "simplecov", "~> 0.9"
end

group :production do
  gem "rails_12factor"
end
