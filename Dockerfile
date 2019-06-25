FROM ruby:2.3.0

COPY . /application
WORKDIR /application

COPY Gemfile Gemfile.lock ./

ENV BUNDLER_VERSION 2.0.1

RUN gem install bundler -v '2.0.1' 
ENV BUNDLER_VERSION 2.0.1
RUN bundle install --jobs 20 --retry 5


COPY . .
ENTRYPOINT ./entrypoint.sh
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]