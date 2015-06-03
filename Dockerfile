FROM ubuntu:14.04

# Install Node.js
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
#ONBUILD COPY package.json /src
# ONBUILD RUN npm install
COPY . /src
WORKDIR /src
#COPY ./start.sh /run/start.sh
RUN npm install -g bower grunt-cli
RUN npm install
RUN bower install --allow-root ---config.interactive=false
#CMD [ "sh", "../start.sh" ]
CMD ["npm", "start"]
