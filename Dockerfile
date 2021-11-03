FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget git unzip -y
RUN mkdir /run/sshd 
RUN wget -O install.sh https://cdn.jsdelivr.net/gh/gitiy1/bthua@master/bt.sh && bash install.sh
RUN rm -f /www/server/panel/data/admin_path.pl
RUN echo '80' > /www/server/panel/data/port.pl && /etc/init.d/bt restart
RUN echo '/usr/sbin/sshd -D' >>/iy.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:iceyear|chpasswd
RUN chmod 755 /iy.sh
EXPOSE 8888
CMD  /iy.sh
