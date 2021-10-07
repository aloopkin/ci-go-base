ARG BASE_IMAGE_TAG
FROM debian:bullseye-slim

USER root

RUN \
  apt update && \
  apt install -y npm aspell aspell-en asciidoctor ruby-asciidoctor-pdf python3 python3-pip && \
  npm install -g asciidoc-link-check && \
  pip install pyspelling && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
