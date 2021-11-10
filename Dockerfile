ARG BASE_IMAGE_TAG
FROM debian:bullseye-slim

USER root

RUN \
  apt update && \
  apt install -y npm aspell aspell-en asciidoctor python3 python3-pip curl ca-certificates golang-go && \
  gem install hexapdf && \
  gem install rouge && \
  gem install asciidoctor-pdf && \
  npm install -g asciidoc-link-check && \
  pip install pyspelling && \
  pip install lemoncheesecake[junit] && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
