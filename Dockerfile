ARG BASE_IMAGE_TAG
FROM debian:bullseye-slim

USER root

RUN \
  apt update && \
  apt install -y npm aspell aspell-en asciidoctor ruby-asciidoctor-pdf python && \
  npm install -g asciidoc-link-check && \
  python -m pip install --upgrade pip setuptools && \
  python -m pip install pyspelling && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
