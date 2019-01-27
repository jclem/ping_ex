FROM alpine

RUN apk add --no-cache bash openssl

RUN mkdir -p /opt/app
WORKDIR /opt/app

ADD _build/prod/rel/ping/releases/*/ping.tar.gz .

ENV MIX_ENV=prod

CMD ./bin/ping foreground
