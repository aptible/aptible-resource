ARG RUBY_VERSION=3.4
FROM ruby:${RUBY_VERSION}

RUN apt-get upgrade -y ca-certificates

RUN egrep '^mozilla/emSign_ECC_Root_CA_-_G3.crt|^mozilla/Comodo_AAA_Services_root.crt' /etc/ca-certificates.conf; [ $? -eq 1 ]

WORKDIR /app
COPY Gemfile /app/
COPY aptible-resource.gemspec /app/
RUN mkdir -p /app/lib/aptible/resource/
COPY lib/aptible/resource/version.rb /app/lib/aptible/resource/
RUN mkdir -p /app/lib/hyper_resource/
COPY lib/hyper_resource/version.rb /app/lib/hyper_resource/

RUN bundle install

COPY . /app

CMD ["bash"]
