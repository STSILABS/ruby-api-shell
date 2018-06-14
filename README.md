# README

## App creation notes

To set up docker, mostly followed https://docs.docker.com/compose/rails/#connect-the-database

  * Added --api and -T flags to rails new command `docker-compose run web rails new . --force --database=postgresql --api -T`

## Local setup

### Prerequisites

[Docker](https://docs.docker.com/install/)

### Instructions

Build the docker containers (also installs gems).

`docker-compose build`

Startup the app the first time and create the database.

`docker-compose up`, then in a 2nd terminal run `docker-compose run web rake db:create`

To stop the app, run `docker-compose down` (i.e. in separate terminal window) and NOT CTRL-C.

If you get an error "A server is already running. Check /myapp/tmp/pids/server.pid.", run `rm tmp/pids/server.pid`

## Gemfile updates

Installing new gems does require a re-run of `docker-compose build`



Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
