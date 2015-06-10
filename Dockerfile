FROM ruby:2.2
WORKDIR /code
# Add the Gemfile so dependencies can be bootstrapped.
ADD Gemfile /code/
RUN bundle install
ENTRYPOINT ["bash", "entrypoint.sh"]
