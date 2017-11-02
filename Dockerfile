FROM library/alpine
MAINTAINER craigtracey@gmail.com

RUN apk update
RUN apk add ucarp
RUN mkdir -p /etc/ucarp/
COPY vip-*.sh /etc/ucarp/
COPY run-ucarp.sh /bin/

CMD /bin/run-ucarp.sh
