source 'https://rubygems.org'

gem 'rails'

gem 'bootsnap', require: false
gem 'bootstrap'
gem 'dartsass-rails'
# rspecで使用するsign_inヘルパーがRails8に対応していないためmainブランチを指定
gem 'devise', git: 'https://github.com/heartcombo/devise', branch: 'main'
gem 'haml-rails'
gem 'importmap-rails'
gem 'kamal', require: false
gem 'propshaft'
gem 'puma'
gem 'simple_form'
gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'
gem 'sqlite3'
gem 'stimulus-rails'
gem 'thruster', require: false
gem 'turbo-rails'

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug'
  gem 'factory_bot_rails'
  gem 'haml_lint'
  gem 'html2haml'
  gem 'rspec-rails'
  gem 'sgcop', github: 'SonicGarden/sgcop', branch: 'main'
end

group :development do
  gem 'bullet'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
