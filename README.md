# README

A simple todo app made with rails

* Ruby version: 2.5
* Rails version: 5.1

The app uses docker and docker-compose to run on local environment.

To setup and start application run:
* sudo docker-compose run web bundle
* sudo docker-compose run web bin/rails db:create
* sudo docker-compose run web bin/rails db:migrate
* sudo docker-compose up

For execute test
* sudo docker-compose run web bin/rails db:test:prepare
* sudo docker-compose run web bundle exec rspec spec/
