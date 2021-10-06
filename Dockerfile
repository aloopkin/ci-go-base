ARG BASE_IMAGE_TAG
FROM bullseye-slim

USER root

RUN \
  apt update && \
  apt install -y npm aspell aspell-en && \
  npm install -g asciidoc-link-check && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
