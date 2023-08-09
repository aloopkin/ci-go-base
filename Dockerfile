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

RUN echo -e "-----BEGIN CERTIFICATE-----\nMIIFeDCCA2CgAwIBAgIITDM8XNhFcKUwDQYJKoZIhvcNAQELBQAwQDELMAkGA1UE\nBhMCRlIxEjAQBgNVBAoTCUV2ZXJUcnVzdDEdMBsGA1UEAxMURXZlclRydXN0IFFB\nIFJvb3QgQ0EwHhcNMjAwMjE4MDAwMDAwWhcNNDAwMjE3MjM1OTU5WjBAMQswCQYD\nVQQGEwJGUjESMBAGA1UEChMJRXZlclRydXN0MR0wGwYDVQQDExRFdmVyVHJ1c3Qg\nUUEgUm9vdCBDQTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALtvfXMN\nXBTcRjUJkDxclZayys1hjXLi5596Xw28/NknlCyU0Xn4tZJdmAwYexWwAxEZkuFn\nTDnxVTgDzQ4eoEuQAHjYAdkJe8J4AB+NknA8cZsyp8bSf9QbEFYIZKToxtB19VVL\nPetylyfL6iePaGzC1BW4BA8+Ol8Iu6CUA1xOXJL4sFfdbFhPQ7QzlhSebRJoPqY2\nry4ESIvq2N5TusBPS/GC5jfroF4Xc0IAvtKOOWFJXtj/eI4bs/vNdW8OKA3ev1BR\nlfbUiDkpj3qtMptjn+MNqdbB8+iIskf1UYzS4Aiva+8r7QcuppeyZE+9KPMQhjOM\nwdV9GFEW3rEXfcbY/kIs3vlEuN8UhQGa87/vyv900bVjKgekRI9zNID6GRMkiVg5\nGu9hCKFrFDxoo7AtYYnrneHlHRMj/lWGW3GSZ6p8gN9pb7TZtK3+QTA+urzpw19Q\ncKNLPbwYUz4IAQDiFedem8iIX+ZZ7Mg17RZ82RrMMjF/f56QzY2X90ojm1aItUIb\nD6xUxRo7CuiCYxNhovyG6jxGCj+IpM07SSDpUSL+G0rUm7EDL4W9CqVKnOgl7N5H\nfflrgveXqCYEsdILz5wVeYKIUjWWY+BMNJvcJogYuzhcUqbbGOWBUvKqut+A8vwl\nNhxHYpVgNX0Cg4ooPI0WIROKWFGyDlsfrMBVAgMBAAGjdjB0MA8GA1UdEwEB/wQF\nMAMBAf8wHQYDVR0OBBYEFLXJ6OUfgI1+XhNPGTrA2GHhxYM8MB8GA1UdIwQYMBaA\nFLXJ6OUfgI1+XhNPGTrA2GHhxYM8MA4GA1UdDwEB/wQEAwIBBjARBgNVHSAECjAI\nMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggIBADOFDMCbmozRg7qJh9uxqIB4jMZ9\nFNYDa2r9h+dVrNSn7YRlnNpP/gnSCuzgCRZ/IJLmVWyEkpklrwMiDNnV6cpUv5LO\nZfkbTNDW6BIptnq9Re4J6wKcO8LsCn5HLGV6VQkboSHA+mnu2inUv8VT7R36A3+O\nv7zna/Zl/aNBwrM59yIRABt5L+Vu9OLgTRK14sxtEnFtmStZfNFLzPx08Z+Y2C4k\n5yG1sri7s2O/gVoSqMCVHJxRn1HEsRZlc9SrT+n6x7MvRvmEZr5bOxkZx2GxfxBP\nNqESv5pWiZew6qqTDbgTDteusRv/5vcc62paqJFB/YkKNdw6f7/mO1l5XmuyfR46\ngu6CZIfTuX0SK5v2k5Tx+/aR4SVbVZ2J9CnqNcU4u7QDurTPLERYxvYfIw7BjmWV\nTyQvX/gQDAoeW4NaKaZKfY69ac+tI/AciEQfvr208XG2n26aySGpQ4DePreV4Qkf\naEXVILU0+Qme7lJX8rV1yIRbBnWoP5yErh2bJaYbyDviVvyBPKUC+3rpAapYPSvA\nPZXcttOjBtv96S1YBtbQ/vK7A9JjxAuKJuqKiqm6mg02Go7tDJzmqtulXFOdzkcx\nqVnHLm+4oDYznBZ5NchnHdh4YNdrMet3U93zfGP4W7kkLzZeLYdH++YD31B4r1UU\nqrrB4gD9c7/yxotg\n-----END CERTIFICATE-----" > /usr/local/share/ca-certificates/qarca.crt && \
  echo -e "-----BEGIN CERTIFICATE-----\r\nMIIDbzCCAlegAwIBAgIUEwjAQulWcBFD9kkiZMhJeA6Y1NUwDQYJKoZIhvcNAQEL\r\nBQAwPzELMAkGA1UEBhMCRlIxEjAQBgNVBAoMCUV2ZXJUcnVzdDEcMBoGA1UEAwwT\r\nRXZlclRydXN0IExhYiBRQSBDQTAeFw0yMzAxMjMxNjA3MTZaFw0zMzAxMjAxNjA3\r\nMTVaMD8xCzAJBgNVBAYTAkZSMRIwEAYDVQQKDAlFdmVyVHJ1c3QxHDAaBgNVBAMM\r\nE0V2ZXJUcnVzdCBMYWIgUUEgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK\r\nAoIBAQDJpkCpifwyIG8D50X\/NA8KQ\/7ykqlhzDYReaMUeMq7mMpR9v4RY8d2DYhI\r\nLzRORQsT9cDZkns7c4LW79yh6fpO9y2lPhvrndiLPIxyYVR28vEfKZnJot+BK7Hc\r\nuQWqf6MAlwZQpSL\/BLAREx7ucjbfHBUDwJhZ8IoDnIfK4roo3FqAXCO\/o+WJBR\/q\r\nyRuEvb71NjLhlj+5HpGQqIWOd\/m95wAWt+eLOaVyXVoKTu3+iMS7eydEhV11BbRg\r\nYuUBqFHhayvcDi3hxvtnxBODeFUWjXclHQZK4uyjl4VGCtRLCWJxyTsg5LbAeJ0b\r\n9W5N1+eXJpJIQlT9uWhcvEve0A\/dAgMBAAGjYzBhMA8GA1UdEwEB\/wQFMAMBAf8w\r\nHwYDVR0jBBgwFoAU7Kw7cz5qgPBzbmfnL72rqit9SWcwHQYDVR0OBBYEFOysO3M+\r\naoDwc25n5y+9q6orfUlnMA4GA1UdDwEB\/wQEAwIBhjANBgkqhkiG9w0BAQsFAAOC\r\nAQEAdVsmlBKMvH1jCVvsIauPyNn4bLnvXyfJhakW+ECJn5qW54mSMYHN3mbMtomI\r\nbZpAeSdLrXX3TpOOGPmKqt1L2Gt4zmL\/sinTv3kvHk7YFUkJOz\/hdkqi5a9myMfk\r\nWxFA49MBNfgopcjko3qrFvY93SjgLLyVCsf9f8IyB1MRPzaV2WFZT8eyUtAzZ7os\r\njSiohzclDX9A\/bKJ7Y0tc1Gy01dADpOcoBjhvQHa9l16+bRgdJxbS0dxAhr2SX2K\r\nnbE6I5K+tT+l59ybgC7YCFQhApY\/AKKwWhHsuefvzwaKr5o66mGtEPxU9LpNP608\r\n\/q84NFTLuAqMNExIvvl\/Ks3V9w==\r\n-----END CERTIFICATE-----" > /usr/local/share/ca-certificates/qaca.crt && \
  dpkg-reconfigure ca-certificates
