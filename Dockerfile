FROM alpine
MAINTAINER lbbniu <lbbniu@qq.com>
WORKDIR /
RUN apk add wget \
    && wget https://github.com/fatedier/frp/releases/download/v0.22.0/frp_0.22.0_linux_amd64.tar.gz \
    && tar zxvf frp_0.22.0_linux_amd64.tar.gz \
    && mv frp_0.22.0_linux_amd64 frp
WORKDIR /frp
ADD frps.ini /frp/
EXPOSE 7000 7500 80 443
CMD ["/frp/frps","-c","/frp/frps.ini"]