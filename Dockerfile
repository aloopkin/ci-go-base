ARG BASE_IMAGE_TAG
FROM debian:bullseye-slim

USER root

RUN \
  echo "deb http://deb.debian.org/debian bullseye-backports main" >> /etc/apt/sources.list && \
  apt update && \
  apt install -y npm aspell aspell-en asciidoctor python3 python3-pip curl ca-certificates golang-1.19-go bundler && \
  ln -s /usr/lib/go-1.19/bin/go /usr/bin/go && \
  ln -s /usr/lib/go-1.19/bin/gofmt /usr/bin/gofmt && \  
  gem install hexapdf && \
  gem install rouge && \
  gem install asciidoctor-pdf && \
  npm install -g asciidoc-link-check && \
  pip install pyspelling && \
  pip install lemoncheesecake[junit] && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN echo -e "MIIFeDCCA2CgAwIBAgIITDM8XNhFcKUwDQYJKoZIhvcNAQELBQAwQDELMAkGA1UEBhMCRlIxEjAQBgNVBAoTCUV2ZXJUcnVzdDEdMBsGA1UEAxMURXZlclRydXN0IFFBIFJvb3QgQ0EwHhcNMjAwMjE4MDAwMDAwWhcNNDAwMjE3MjM1OTU5WjBAMQswCQYDVQQGEwJGUjESMBAGA1UEChMJRXZlclRydXN0MR0wGwYDVQQDExRFdmVyVHJ1c3QgUUEgUm9vdCBDQTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALtvfXMNXBTcRjUJkDxclZayys1hjXLi5596Xw28/NknlCyU0Xn4tZJdmAwYexWwAxEZkuFnTDnxVTgDzQ4eoEuQAHjYAdkJe8J4AB+NknA8cZsyp8bSf9QbEFYIZKToxtB19VVLPetylyfL6iePaGzC1BW4BA8+Ol8Iu6CUA1xOXJL4sFfdbFhPQ7QzlhSebRJoPqY2ry4ESIvq2N5TusBPS/GC5jfroF4Xc0IAvtKOOWFJXtj/eI4bs/vNdW8OKA3ev1BRlfbUiDkpj3qtMptjn+MNqdbB8+iIskf1UYzS4Aiva+8r7QcuppeyZE+9KPMQhjOMwdV9GFEW3rEXfcbY/kIs3vlEuN8UhQGa87/vyv900bVjKgekRI9zNID6GRMkiVg5Gu9hCKFrFDxoo7AtYYnrneHlHRMj/lWGW3GSZ6p8gN9pb7TZtK3+QTA+urzpw19QcKNLPbwYUz4IAQDiFedem8iIX+ZZ7Mg17RZ82RrMMjF/f56QzY2X90ojm1aItUIbD6xUxRo7CuiCYxNhovyG6jxGCj+IpM07SSDpUSL+G0rUm7EDL4W9CqVKnOgl7N5HfflrgveXqCYEsdILz5wVeYKIUjWWY+BMNJvcJogYuzhcUqbbGOWBUvKqut+A8vwlNhxHYpVgNX0Cg4ooPI0WIROKWFGyDlsfrMBVAgMBAAGjdjB0MA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFLXJ6OUfgI1+XhNPGTrA2GHhxYM8MB8GA1UdIwQYMBaAFLXJ6OUfgI1+XhNPGTrA2GHhxYM8MA4GA1UdDwEB/wQEAwIBBjARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggIBADOFDMCbmozRg7qJh9uxqIB4jMZ9FNYDa2r9h+dVrNSn7YRlnNpP/gnSCuzgCRZ/IJLmVWyEkpklrwMiDNnV6cpUv5LOZfkbTNDW6BIptnq9Re4J6wKcO8LsCn5HLGV6VQkboSHA+mnu2inUv8VT7R36A3+Ov7zna/Zl/aNBwrM59yIRABt5L+Vu9OLgTRK14sxtEnFtmStZfNFLzPx08Z+Y2C4k5yG1sri7s2O/gVoSqMCVHJxRn1HEsRZlc9SrT+n6x7MvRvmEZr5bOxkZx2GxfxBPNqESv5pWiZew6qqTDbgTDteusRv/5vcc62paqJFB/YkKNdw6f7/mO1l5XmuyfR46gu6CZIfTuX0SK5v2k5Tx+/aR4SVbVZ2J9CnqNcU4u7QDurTPLERYxvYfIw7BjmWVTyQvX/gQDAoeW4NaKaZKfY69ac+tI/AciEQfvr208XG2n26aySGpQ4DePreV4QkfaEXVILU0+Qme7lJX8rV1yIRbBnWoP5yErh2bJaYbyDviVvyBPKUC+3rpAapYPSvAPZXcttOjBtv96S1YBtbQ/vK7A9JjxAuKJuqKiqm6mg02Go7tDJzmqtulXFOdzkcxqVnHLm+4oDYznBZ5NchnHdh4YNdrMet3U93zfGP4W7kkLzZeLYdH++YD31B4r1UUqrrB4gD9c7/yxotg" | openssl base64 -d -A > /usr/local/share/ca-certificates/qarca.crt && \
  dpkg-reconfigure -fnoninteractive ca-certificates
