FROM node:16-bullseye-slim

ENV DEBIAN_FRONTEND noninteractive

# for arm64 support we need to install chromium provided by debian
# npm ERR! The chromium binary is not available for arm64.
# https://github.com/puppeteer/puppeteer/issues/7740

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Replace 'deb.debian.org' with a mirror URL
# RUN sed -i 's/deb.debian.org/mirror.us.leaseweb.net/g' /var/lib/apt/sources.list 

RUN apt-get update && \
    apt-get install -y wget gnupg && \
    apt-get install -y fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
        libgtk2.0-0 libnss3 libatk-bridge2.0-0 libdrm2 libxkbcommon0 libgbm1 libasound2 && \
    apt-get install -y chromium && \
    apt-get clean

# Just for development - not required in any way
#RUN apt-get install -y vim bash

WORKDIR /src
COPY ./src /src

# Should be better move this into a package.json?
#RUN npm i puppeteer express body-parser temp
RUN npm install

CMD ["node", "webservices.js"]
