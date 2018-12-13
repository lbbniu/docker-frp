FROM alpine
MAINTAINER lbbniu <lbbniu@qq.com>
VOLUME ['/server']
WORKDIR /server
RUN apk add wget \
    && wget https://github.com/fatedier/frp/releases/download/v0.22.0/frp_0.22.0_linux_amd64.tar.gz \
    && tar zxvf frp_0.22.0_linux_amd64.tar.gz \
    && mv frp_0.22.0_linux_amd64 frp
WORKDIR /server/frp
ADD frps.ini .
EXPOSE 7000
EXPOSE 7500
EXPOSE 80
EXPOSE 443
CMD ['/server/frp/frps','-c','/server/frp/frps.ini']