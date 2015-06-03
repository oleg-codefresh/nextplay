FROM    centos:centos6

# Install Node.js
 # Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN     yum install -y npm
#ONBUILD COPY package.json /src
# ONBUILD RUN npm install
COPY . /src
WORKDIR /src
#COPY ./start.sh /run/start.sh
RUN npm install -g bower grunt-cli
RUN npm install
RUN bower install --allow-root ---config.interactive=false
#CMD [ "sh", "../start.sh" ]
EXPOSE 9000
CMD ["npm", "start"]
