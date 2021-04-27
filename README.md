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

# CI/CD

Every time a pull request is made a GitHub action runs.
This action will run test cases on the new code to ensure no ppreviously working test cases have been broken.
If your new code does not pass test cases, then you will need to fix the bugs and resubmit the pull request.

# Deployment to Heroku

1. Setup a pipeline on Heroku
2. Connect it to this GitHub repository
3. In the settings on the Heroku pipeline, turn on automatic deployments
4. When a pull request is accepted, the app will automatically build on the pipeline
5. If it is the first Heroku build, you will need to open the bash and run ```rails db:migrate```
