FROM ruby:2.6.0-slim
LABEL maintainers="Dan Pickens <Daniel@gmail.com>"

ENV RUBY_VERSION=2.6.0
ENV JEKYLL_VERSION=3.8.5


RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y python3-pip
RUN gem install bundler jekyll
