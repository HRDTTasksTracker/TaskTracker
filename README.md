# TaskTracker ReadMe

ruby version 3.0 

# Compiling

1. run ```bundle install``` to install all dependencies
2. run ```rails server``` in the terminal. Be sure you are in the root app directory.
3. open a brower and visit "localhost"

If the app fails to compile, you may need to install webpacker.
   1. run ```bundle``` while in the applications root directory
   2. run ```rails webpacker:install```
   3. run ```rails webpacker:compile```
   4. Finally, run ```rails server```

To initialize the database
   1. run ```rails db:migrate```

# Running Test

1. cd to the root directory of the app project
2. be sure you have run ```bundle install```
3. run ```rspec spec/models/tests.rb``` to run the applications test

You can add your own test in the test.rb file.




# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions  
