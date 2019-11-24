# Readme

### First time setup without rails app

1. Files available for bare minimum execution
  - Dockerfile
  - docker-compose.yml
  - entrypoint.sh
  - Gemfile (for building the image for the first time)
  - Gemfile.lock

2. Creating rails app

`docker-compose run web rails new . --force --no-deps --database=postgresql`

3. Create DB and run migration
`docker-compose run web rake db:create`
`docker-compose run web rake db:migrate`
