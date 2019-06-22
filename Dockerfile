FROM ruby:2.3.0

COPY . /application
WORKDIR /application

COPY Gemfile Gemfile.lock ./
ENV BUNDLER_VERSION 2.0.1

RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . .
ENTRYPOINT ./entrypoint.sh