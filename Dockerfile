FROM ruby:2.4.0

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev npm

RUN wget https://nodejs.org/dist/v6.10.0/node-v6.10.0-linux-x64.tar.xz
RUN tar -C /usr/local --strip-components 1 -xJf node-v6.10.0-linux-x64.tar.xz

RUN gem uninstall -i /usr/local/lib/ruby/gems/2.4.0 bundler rake
RUN gem install bundler --version '1.13.7' -N

ENV APP_HOME /grupo-9
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock


RUN bundle _1.13.7_ install --jobs=3 --retry=3

COPY . $APP_HOME
