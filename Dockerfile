FROM ruby:3.2.2

RUN apt-get update -q 

ADD . ./mdtranslator

WORKDIR /mdtranslator

RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]