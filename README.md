# README

## App creation notes

To set up docker, mostly followed https://docs.docker.com/compose/rails/#connect-the-database

  * Added --api and -T flags to rails new command `docker-compose run web rails new . --force --database=postgresql --api -T`

## Initial local dev setup

### Prerequisites

[Docker](https://docs.docker.com/install/)

### Instructions

Build the docker containers (also installs gems).

`docker-compose build`

Startup the app the first time and create the database.

`docker-compose up`, then in a 2nd terminal run `docker-compose run web rake db:create`

To stop the app, run `docker-compose down` (i.e. in separate terminal window) and NOT CTRL-C.

## Local Development

Start: `docker-compose up` - the app will be running on http://localhost:3001/

### Notes

If you need to change the port for the local machine, you can update the docker-compose.yml file. For example `- "3001:3000"` will map the rails server (3000) to 3001 in the local dev machine.

If you get an error "A server is already running. Check /myapp/tmp/pids/server.pid.", run `rm tmp/pids/server.pid`

## Gemfile updates

Note from [Docker tutorial](https://docs.docker.com/install/):

If you make changes to the Gemfile or the Compose file to try out some different configurations, you need to rebuild. Some changes require only `docker-compose up --build`, but a full rebuild requires a re-run of `docker-compose run web bundle install` to sync changes in the Gemfile.lock to the host, followed by `docker-compose up --build`.
