FROM alpine
MAINTAINER lbbniu <lbbniu@qq.com>
VOLUME ['/server']
WORKDIR /server
RUN curl https://github.com/fatedier/frp/releases/download/v0.22.0/frp_0.22.0_linux_amd64.tar.gz \
    -O frp_0.22.0_linux_amd64.tar.gz \
    && tar zxvf frp_0.22.0_linux_amd64.tar.gz \
    && mv frp_0.22.0_linux_amd64 frp
ADD frps.ini .

EXPOSE 7000
EXPOSE 7500
EXPOSE 80
EXPOSE 443
CMD ['./frps','-c','./frps.ini']