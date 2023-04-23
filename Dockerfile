FROM ubuntu
RUN apt-get update
RUN apt-get install gzip -y
RUN apt-get install wget -y
RUN apt-get install git -y
RUN mkdir /opt/clash/ && mkdir /etc/clash
RUN wget -O /opt/clash/clash.gz https://github.com/Dreamacro/clash/releases/download/v1.15.1/clash-linux-amd64-v1.15.1.gz
RUN git clone https://github.com/Dreamacro/clash-dashboard.git
RUN gzip -d /opt/clash/clash.gz
RUN mv /clash-dashboard /opt/clash-dashboard
RUN cd /opt/clash-dashboard && git checkout -b gh-pages origin/gh-pages
COPY ./config.yaml /etc/clash/config.yaml
RUN chmod +x /opt/clash/clash
CMD /opt/clash/clash -d /etc/clash/

