source 'https://rubygems.org' do


git "https://github.com/rails/rails.git" do
  gem "activesupport"
  gem "actionpack"
end

platforms :ruby do
  gem "ruby-debug"
  gem "sqlite3"
end

group :development, :optional => true do
  gem "devgemgroup"
  gem "tester"
end

 
gemspec



gem 'helm-rb'

group :development do
  gem 'rake'
end

group :test do
  gem 'rspec'
end
