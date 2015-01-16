source 'https://rubygems.org'

#===========>>
group :Haml do
  gem "haml"
end
#===========>>

#===========>>
# Daniel Tseng::
group :daniel_test do
  
  # specifyremote Gem
  #gem 'voteable_test'
  
  # specify version
  #gem 'voteable_test', '= 0.0.0'

  # testing locally  
  #gem 'voteable_danielt_test', path: '/Users/iRSR/Documents/IT-Tealeaf/2-4-Lesson/Exercise/voteable-gem-3'
  gem 'voteable_danielt_test'
  #gem 'slugable_daniel_test', path: '/Users/iRSR/Documents/IT-Tealeaf/2-4-Lesson/Exercise/slugable-gem-1'
  gem 'slugable_daniel_test'
end
#===========>>


#===========>>
#[Bootstrap]
# Use bootstrap-sass 
# Official Sass port of Bootstrap http://getbootstrap.com/css/#sass
gem 'bootstrap-sass', '~> 3.3.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Rails 4.x, Please make sure sprockets-rails is at least v2.1.4.
gem 'sprockets', '~> 2.12.3'

#Bootstrap requires the use of Autoprefixer to add browser vendor prefixes automatically. Simply add the gem:
#gem 'autoprefixer-rails'

# Call JavaScript code and manipulate JavaScript objects from Ruby. Call Ruby code and manipulate Ruby objects from JavaScript.
# Embed the V8 JavaScript interpreter into Ruby.
# https://github.com/cowboyd/therubyracer
gem 'therubyracer', platforms: :ruby
#===========>>

gem 'rails', '4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'


# the OpenBSD bcrypt() password hashing algorithm
# to perform one way hash
gem 'bcrypt-ruby', '~> 3.0.0' #for rails 4.0.0

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'quiet_assets'
  gem 'pry'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
