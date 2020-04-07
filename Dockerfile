FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /mcu
WORKDIR /mcu
COPY Gemfile /mcu/Gemfile
COPY Gemfile.lock /mcu/Gemfile.lock
RUN bundle install
COPY . /mcu

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
