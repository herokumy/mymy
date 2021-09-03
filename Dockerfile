  
FROM debian
RUN apt update
RUN apt install ssh wget npm unzip -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd
RUN echo 'wget --no-check-certificate "https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip"  && unzip -o ngrok-stable-linux-amd64.zip ngrok && rm ngrok-stable-linux-amd64.zip' >>/1.sh
RUN echo 'chmod +x ngrok' >>/1.sh
RUN echo './ngrok authtoken 1xbf1GRnZKr2RFL9p3LOgAKcZtn_7iAK9fzdsYwENnNPij8Gf' >>/1.sh
RUN echo './ngrok tcp 22 &' >>/1.sh
RUN echo 'wstunnel -s 0.0.0.0:80 &' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:uncleluo|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80
CMD  /1.sh
