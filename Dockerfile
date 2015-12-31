FROM qnib/d-node

ENV GOPATH=/usr/local/
RUN apt-get install -y golang git
RUN go get github.com/tools/godep && \
    go get github.com/sensu/uchiwa && \
    cd $GOPATH/src/github.com/sensu/uchiwa && \
    npm install --production --unsafe-perm && \
    go install
ADD etc/uchiwa/config.json /etc/uchiwa/
ADD etc/supervisord.d/sensu-uchiwa.ini /etc/supervisord.d/
ADD etc/consul.d/sensu-uchiwa.json /etc/consul.d/
