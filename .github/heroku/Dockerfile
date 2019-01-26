FROM docker

RUN apk add --update nodejs nodejs-npm
RUN npm install --global heroku

ENTRYPOINT ["heroku"]
