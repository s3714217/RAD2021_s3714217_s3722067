1. Development Team

  - Thien Nguyen (s3714217) 
  - Danny Le (s3722067)
  
2. Distribution is 50:50
3. Highest level attempted is 80+ (1 90+ task)
4. Heroku URL: https://agile-crag-62155.herokuapp.com/
Build log:
-----> Building on the Heroku-20 stack
-----> Using buildpack: heroku/ruby
-----> Ruby app detected
-----> Installing bundler 1.17.3
-----> Removing BUNDLED WITH version in the Gemfile.lock
-----> Compiling Ruby/Rails
-----> Using Ruby version: ruby-2.6.6
-----> Installing dependencies using bundler 1.17.3
       Running: BUNDLE_WITHOUT='development:test' BUNDLE_PATH=vendor/bundle BUNDLE_BIN=vendor/bundle/bin BUNDLE_DEPLOYMENT=1 BUNDLE_GLOBAL_PATH_APPENDS_RUBY_SCOPE=1 bundle install -j4
       The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.
       Using rake 13.0.3
       Using concurrent-ruby 1.1.8
       Using i18n 1.8.10
       Using minitest 5.14.4
       Using thread_safe 0.3.6
       Using tzinfo 1.2.9
       Using activesupport 5.2.6
       Using builder 3.2.4
       Using erubi 1.10.0
       Using mini_portile2 2.5.1
       Using racc 1.5.2
       Using nokogiri 1.11.5 (x86_64-linux)
       Using rails-dom-testing 2.0.3
       Using crass 1.0.6
       Using loofah 2.9.1
       Using rails-html-sanitizer 1.3.0
       Using actionview 5.2.6
       Using rack 2.2.3
       Using rack-test 1.1.0
       Using actionpack 5.2.6
       Using nio4r 2.5.7
       Using websocket-extensions 0.1.5
       Using websocket-driver 0.7.3
       Using actioncable 5.2.6
       Using globalid 0.4.2
       Using activejob 5.2.6
       Using mini_mime 1.1.0
       Using mail 2.7.1
       Using actionmailer 5.2.6
       Using activemodel 5.2.6
       Using arel 9.0.0
       Using activerecord 5.2.6
       Using marcel 1.0.1
       Using activestorage 5.2.6
       Using execjs 2.7.0
       Using autoprefixer-rails 10.2.5.0
       Using bcrypt 3.1.12
       Using rb-fsevent 0.11.0
       Using ffi 1.15.0
       Using rb-inotify 0.10.1
       Using sass-listen 4.0.0
       Using sass 3.7.4
       Using bootstrap-sass 3.3.7
       Using bundler 1.17.3
       Using coffee-script-source 1.12.2
       Using coffee-script 2.4.1
       Using method_source 1.0.0
       Using thor 1.1.0
       Using railties 5.2.6
       Using coffee-rails 4.2.2
       Using hashie 4.1.0
       Using multi_json 1.15.0
       Using jbuilder 2.7.0
       Using jquery-rails 4.3.1
       Using oauth 0.5.6
       Using rack-protection 2.1.0
       Using omniauth 2.0.4
       Using omniauth-oauth 1.2.0
       Using omniauth-rails_csrf_protection 1.0.0
       Using omniauth-twitter 1.4.0
       Using pg 0.20.0
       Using puma 3.9.1
       Using sprockets 3.7.2
       Using sprockets-rails 3.2.2
       Using rails 5.2.6
       Using tilt 2.0.10
       Using sass-rails 5.0.6
       Using turbolinks-source 5.2.0
       Using turbolinks 5.0.1
       Using uglifier 3.2.0
       Bundle complete! 21 Gemfile dependencies, 70 gems now installed.
       Gems in the groups development and test were not installed.
       Bundled gems are installed into `./vendor/bundle`
       Bundle completed (0.48s)
       Cleaning up the bundler cache.
       The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.
-----> Installing node-v12.16.2-linux-x64
-----> Detecting rake tasks
-----> Preparing app for Rails asset pipeline
       Running: rake assets:precompile
       Asset precompilation completed (2.01s)
       Cleaning assets
       Running: rake assets:clean
-----> Detecting rails configuration
###### WARNING:
       You have not declared a Ruby version in your Gemfile.
       
       To declare a Ruby version add this line to your Gemfile:
       
       ```
       ruby "2.6.6"
       ```
       
       For more information see:
         https://devcenter.heroku.com/articles/ruby-versions
###### WARNING:
       There is a more recent Ruby version available for you to use:
       
       2.6.7
       
       The latest version will include security and bug fixes. We always recommend
       running the latest version of your minor release.
       
       Please upgrade your Ruby version.
       
       For all available Ruby versions see:
         https://devcenter.heroku.com/articles/ruby-support#supported-runtimes
###### WARNING:
       No Procfile detected, using the default web server.
       We recommend explicitly declaring how to boot your server process via a Procfile.
       https://devcenter.heroku.com/articles/ruby-default-web-server
-----> Discovering process types
       Procfile declares types     -> (none)
       Default types for buildpack -> console, rake, web
-----> Compressing...
       Done: 80.2M
-----> Launching...
       Released v7
       https://agile-crag-62155.herokuapp.com/ deployed to Heroku

6. RAD2021_s3714217_s3722067 / https://github.com/s3714217/RAD2021_s3714217_s3722067

7. Timesheet

Thien Nguyen 			
Date	Time	Duration	Activity
April 20th	13:00 - 16:00	3 hours	Set up project 
April 20th	17:00 - 19:00	2 hours	Add main html with top banner, popular and collection summary
April 30th	12:00 - 14:00	2 hours	Add bootstrap CSS and header layout with redirecting
May 7th	13:00 - 15:00	2 hours	Add Collection page with 4 main category
May 7th	15:00 - 18:00	3 hours	Add Filter
May 7th	18:00 - 19:00	1 hour	Add Search Bar
May 10th	10:00 - 13:00	3 hours	Add DIY Login/Logout with input validation
May 10th	13:00 - 15:00	2 hours	Add DIY Sign up with with input validation
May 13th	10:00 - 13:00	3 hours	Setup Twitter API
May 14th	13:00 - 15:00	2 hours	Add Twitter credentials
May 14th	15:00 - 21:00	6 hours	Add Login with Twitter
May 17th	12:00 - 13:00	1 hours	Add AccessToken models
May 17th	14:00 - 17:00	3 hours	Add Forgot Password
May 21st	19:00 - 21:00	2 hours	Debugging
May 21st	21:00 - 22:00	1 hours	Refractoring and Clean up code
May 22nd	10:00 - 11:00	1 hours	Add comment
May 23rd	15:00 - 16:00	1 hours	Add more test cases
May 23rd	16:00 - 17:00	1 hours	Finalize submission document

Danny Le			
Date	Time	Duration	Activity
April 25th	12:00-13:00	1 hour	Add scaffolding for items and users
April 29th	13:00-15:00	2 hours	Add scaffolding for subscriber and edit users and add seed file
May 1st	9:00-14:00	5 hours	Added newsletter functionality (Wip)
May 4th	12:00-13:00	1 hour	Add validation with newsletter
May 5th	13:00-15:00	2 hours	Add checkout page in progress
May 6th	13:00-14:30	1.5 hour	Finished basic checkout page
May 7th	13:00-18:00	5 hours	Add product details page and cart functionality
May 7th	20:00-24:00	4 hours	Add more checkout and subcription messages
May 8th	21:00-02:00	3 hours	Add saved list with product details
May 9th	12:00-17:30	5.5 hours	Add rating for new user, colour and size in options, add footer, change item schema
May 10th	21:00-24:00	3 hours	Add testing collections page to add items
May 11th	12:00-14:30	2.5 hours	Add simple search, persistence and remove hardedcoded user 
May 12th	15:00-18:00	3 hours	Add favourites to checkout and favourites to collection and saved list
May 13th	12:30-15:00	2.5 hourss	Fixed saved-list merge error and integrate favourites tag
May 14th	12:00-14:00	2 hours	Add profile page
May 17th	12:30-15:00	2.5 hours	Add admin page and production config
May 20th	12:30-16:00	5.5 hours	Add tests to models and controller and refactoring
May 22nd	22:00-02:00	4 hours	Add comments and rework seed file
May 23rd	08:00-17:00	9 hours	
