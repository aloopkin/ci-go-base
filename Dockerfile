ARG BASE_IMAGE_TAG
FROM debian:bullseye-slim

USER root

RUN \
  apt update && \
  apt install -y npm aspell aspell-en asciidoctor python3 python3-pip curl ca-certificates && \
  gem install hexapdf && \
  gem install asciidoctor-pdf && \
  npm install -g asciidoc-link-check && \
  pip install pyspelling && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
