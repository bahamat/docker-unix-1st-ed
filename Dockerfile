FROM ubuntu:trusty
EXPOSE 5555
WORKDIR /opt
ADD Unix-1st-Edition-jun72 /opt/Unix-1st-Edition-jun72
WORKDIR /opt/Unix-1st-Edition-jun72
CMD ./simh.cfg
