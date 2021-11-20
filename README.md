
# Culture_in_blog

# bin/bundle

bundle install
rails db:create
rails db:migrate
rails d:seed
yarn install

# docker

docker-compose build
docker-compose up
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose run web rails db:seed