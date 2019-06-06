FROM ubuntu:18.04
RUN set -eux \
  && apt-get update \
  && apt-get install -y --no-install-recommends curl iproute2 ca-certificates \
  && rm -rf /var/lib/apt/lists/*
COPY ./objs/bin/mtproto-proxy /usr/local/bin
RUN mkdir /etc/telegram
RUN curl -s https://core.telegram.org/getProxySecret -o /etc/telegram/hello-explorers-how-are-you-doing
RUN mkdir /data
COPY ./run.sh /run.sh
CMD ["/bin/sh", "-c", "/bin/bash /run.sh"]