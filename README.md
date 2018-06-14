# API Shell App

Ruby on Rails shell application with a REST API.

### Versions

Uses ruby 2.4 and rails 5.2 (not pre-req's on host laptop).

## Initial local dev environment setup

### Prerequisites

[Docker](https://docs.docker.com/install/)

### Instructions

##

1. `docker-compose build` to build the docker containers (also installs gems).

2. `docker-compose up` to startup the app the first time.

3. In a 2nd terminal run `docker-compose run web rails db:create` to create the database. Then run `docker-compose run web rails db:seed` to seed the DB with some example data.

## Local Development (general)

 * Start: `docker-compose up` - the app will be running on http://localhost:3001/

 * Stop: `docker-compose down` - (i.e. in separate terminal window) and *not using CTRL-C*.

 * Command line: to access the web server command line, preface any commands with `docker-compose run web`, e.g. `docker-compose run web rails generate rspec:install`. You can alternatively access the container shell directly `docker-compose run web bash`.

 * Run tests: `docker-compose run web rspec`

### Notes

 * If you need to change the port for the local machine, you can update the docker-compose.yml file. For example `- "3001:3000"` will map the rails server (3000) to 3001 in the local dev machine.

 * If you get an error "A server is already running. Check /myapp/tmp/pids/server.pid.", run `rm tmp/pids/server.pid`

 * **Gemfile Updates** If you make changes to the Gemfile or the Compose file to try out some different configurations, you need to rebuild. Some changes require only `docker-compose up --build`, but a full rebuild requires a re-run of `docker-compose run web bundle install` to sync changes in the Gemfile.lock to the host, followed by `docker-compose up --build`. *from [Docker tutorial](https://docs.docker.com/install/)*

## API Development Cycle Example

The below example steps create a sample API for conference rooms.

*(omitting `docker-compose run web` prefixes for readability)*

### Generate database-backed model

__Generate model__: `rails g model Room title:string building:string capacity:integer` - creates database migration script, model file, model unit tests.

__Migrate database__: `rails db:migrate` - note that this updates the `/db/schema.rb` file which is a useful reference of the database-backed models.

__Update unit tests__: edit respective file(s) in `/spec/models/`.

__Run (failing) tests__: `rspec`

__Write code__: in this case, under `app/models/`

### Generate REST API controller

__Generate controller__: `rails g controller Rooms` - this generates the controller and unit tests. However, we'll *delete the controller specs*. We'll use request specs instead. `rm -rf /spec/controllers/`

__Create request spec__: `mkdir spec/requests && touch spec/requests/rooms_spec.rb`

__Create factories__: `touch spec/factories/rooms.rb` - needed for any new model

__Write code__: Need to update `config/routes.rb` for new controllers/routes.

__Create seed data__: (optional) if you want to be able to seed the database with sample data. Update `db/seeds.rb` and run `rails db:seed`.

## App creation notes

To set up docker, mostly followed https://docs.docker.com/compose/rails/#connect-the-database

  * Added --api and -T flags to rails new command `docker-compose run web rails new . --force --database=postgresql --api -T`

To setup the rails app, mostly followed https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one

 * Changed a couple gem versions (see `Gemfile`)
