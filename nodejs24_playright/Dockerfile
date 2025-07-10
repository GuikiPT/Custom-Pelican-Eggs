FROM node:24-bookworm-slim

LABEL author="GuikiPT" maintainer="guikipt@gmail.com"

RUN useradd -m -d /home/container container
STOPSIGNAL SIGINT

RUN apt update \
    && apt -y install \
        ffmpeg \
        iproute2 \
        git \
        sqlite3 \
        libsqlite3-dev \
        python3 \
        python3-dev \
        ca-certificates \
        dnsutils \
        tzdata \
        zip \
        tar \
        curl \
        build-essential \
        libtool \
        iputils-ping \
        libnss3 \
        tini

RUN npm install --global npm@latest typescript ts-node @types/node

RUN npm install -g corepack
RUN corepack enable
RUN corepack prepare pnpm@latest --activate

RUN npm install -g playwright
RUN npx playwright install --with-deps

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
CMD ["/entrypoint.sh"]
