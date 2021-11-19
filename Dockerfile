FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm
RUN npm i -g yarn && yarn

RUN mkdir /Culture_in_blog
WORKDIR /Culture_in_blog
COPY Gemfile /Culture_in_blog/Gemfile
COPY Gemfile.lock /Culture_in_blog/Gemfile.lock
RUN bundle install
COPY . /Culture_in_blog

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]