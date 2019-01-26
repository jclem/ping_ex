FROM alpine

RUN apk add --no-cache bash openssl

RUN mkdir -p /opt/app
WORKDIR /opt/app

ADD _build/prod/rel/ping/releases/*/ping.tar.gz

ARG PORT=4000
ENV PORT=$PORT
EXPOSE $PORT

ENV MIX_ENV=prod

CMD ./bin/ping foreground
