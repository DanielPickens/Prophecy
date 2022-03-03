FROM ruby:alpine

MAINTAINER danielpickens

RUN apk update && apk upgrade && apk add --no-cache git make openssh

RUN gem install --quiet \
    rake \
    

WORKDIR /data
