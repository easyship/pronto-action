#!/bin/bash
docker run --rm -it -v $(pwd)/Gemfile:/Gemfile -v $(pwd)/Gemfile.lock:/Gemfile.lock ruby:3-alpine sh -c "apk add build-base cmake openssl-dev;bundle update"
