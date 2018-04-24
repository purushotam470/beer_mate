source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'rake'
gem 'httpclient'
gem 'bcrypt', '~> 3.1.11'
gem 'jwt'

group :development do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry','~>0.11.0'
  gem 'pry-rails','~>0.3.6'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'erd'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
