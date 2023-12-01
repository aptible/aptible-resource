FROM aptible/ruby:2.7

ADD . /app

WORKDIR /app

RUN bundle install

RUN bundle exec rake
