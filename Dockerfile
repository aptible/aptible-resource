ARG RUBY_VERSION=2.3.1
FROM ruby:${RUBY_VERSION}

ARG BUNDLER_VERSION=1.17.3
ENV BUNDLER_VERSION=${BUNDLER_VERSION}
RUN if [ "${BUNDLER_VERSION}" != "" ] ; then \
      gem install bundler -v "${BUNDLER_VERSION}" ; \
    fi

WORKDIR /app
COPY Gemfile /app/
COPY aptible-resource.gemspec /app/
RUN mkdir -p /app/lib/aptible/resource/
COPY lib/aptible/resource/version.rb /app/lib/aptible/resource/
RUN mkdir -p /app/lib/aptible/resource/
COPY lib/aptible/resource/version.rb /app/lib/aptible/resource/
RUN mkdir -p /app/lib/hyper_resource/
COPY lib/hyper_resource/version.rb /app/lib/hyper_resource/

RUN bundle install

COPY . /app

CMD ["bash"]
