ARG BASE_IMAGE_TAG
FROM debian:bullseye-slim

USER root

RUN \
  apt update && \
  apt install -y npm aspell aspell-en asciidoctor ruby-asciidoctor-pdf && \
  npm install -g asciidoc-link-check && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
