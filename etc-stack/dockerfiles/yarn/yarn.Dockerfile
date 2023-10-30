FROM node:10.17.0-buster

CMD [ "yarn start" ]

EXPOSE 3000

WORKDIR /app

RUN apt-get update \
  && apt-get install -y \
  apt-transport-https \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get install -y \
  && apt-get install python3-pip -y\
  yarn \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install cbor2 \
  && pip3 install waiter \
  && pip3 install leb128 \
  && pip3 install ecdsa \
  && pip3 install mnemonic \
  && pip3 install httpx 
