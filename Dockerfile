FROM debian:buster

# Download and install hugo
ENV HUGO_VERSION 0.90.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb

COPY entrypoint.sh /opt/entrypoint.sh

RUN    apt-get -qq update \
    && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends git ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /opt/entrypoint.sh \
    && dpkg -i /tmp/hugo.deb \
    && rm /tmp/hugo.deb 

WORKDIR /usr/share/blog

ENTRYPOINT ["/opt/entrypoint.sh"]