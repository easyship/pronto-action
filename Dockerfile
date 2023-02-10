# Default values of ARGs in global scope
ARG RUBY_VER=3

# https://hub.docker.com/_/ruby
FROM ruby:${RUBY_VER}-alpine

# Install Rubygems and dependencies
WORKDIR /pronto

COPY Gemfile Gemfile
RUN set -eux; \
    apk add --no-cache --update --virtual .ruby-builddeps \
    build-base \
    cmake \
    openssl-dev \
    ; \
    bundle install --jobs 20 --retry 5 \
    ; \
    apk del --purge --no-network .ruby-builddeps \
    ; \
    apk add --no-cache --update \
    jq \
    git \
    ;

COPY entrypoint.sh entrypoint.sh
