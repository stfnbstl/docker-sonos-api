FROM node:carbon-alpine

# Install git
RUN apk update && apk upgrade && \
    apk add --no-cache git curl

# Clone SONOS API
RUN mkdir /nodes && cd /nodes && \
    git clone https://github.com/jishi/node-sonos-http-api.git \
    && cd node-sonos-http-api

# Install prerequisites
RUN cd /nodes/node-sonos-http-api \
    && npm install --production

# Check if the webserver is functional
HEALTHCHECK --interval=1m --timeout=2s \
  CMD curl -LSs http://localhost:5005 || exit 1

# Start NPM
CMD cd /nodes/node-sonos-http-api \
    && npm start
