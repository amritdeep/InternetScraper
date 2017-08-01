FROM ruby:2.2.1

RUN apt-get update && apt-get install build-essential -y

RUN mkdir -p /workspace
WORKDIR /workspace

COPY Gemfile /workspace/Gemfile 
COPY Gemfile.lock /workspace/Gemfile.lock
COPY . /workspace/

# CMD["ls"]