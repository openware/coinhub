FROM node:16.16-alpine

ENV HOME /app
ENV BITGO_ENV test

RUN apk update
RUN apk upgrade

WORKDIR ${HOME}
COPY ./package.json ./yarn.lock ./

RUN yarn install --production

COPY . .

USER node

EXPOSE 8080

CMD ["sh", "-c", "./bin/coinhub -e=$BITGO_ENV"]
