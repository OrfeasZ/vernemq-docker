FROM ubuntu:16.04

RUN apt-get update && \
	apt-get install wget libssl-dev logrotate sudo -y

RUN cd /tmp && \
	wget https://bintray.com/artifact/download/erlio/vernemq/deb/xenial/vernemq_1.1.1-1_amd64.deb && \
	dpkg -i vernemq_1.1.1-1_amd64.deb

VOLUME ["/etc/vernemq"]

CMD /usr/sbin/vernemq start && sleep 10 && tail -F /var/log/vernemq/console.log /var/log/vernemq/error.log