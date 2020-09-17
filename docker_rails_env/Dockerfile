FROM ruby:2.7.1-alpine3.12
RUN apk add --no-cache --update bash \
    build-base \
    nodejs \
    postgresql-dev \
    curl \
    yarn \
    tzdata \
    imagemagick \
    less \
    vim

RUN mkdir /shelter
WORKDIR /shelter
COPY Gemfile /shelter/Gemfile
COPY Gemfile.lock /shelter/Gemfile.lock
RUN bundle install

COPY . /shelter
COPY ./docker_rails_env/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000
