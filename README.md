# docker-asterisk

To start first create a volume

``docker volume create asterisk``

Now start

``docker run -p 5060:5060/udp -p 5061:5061/udp -p 5060:5060/tcp -p 5061:5061/tcp -p 8088:8088/tcp -p 5038:5038/tcp -v asterisk:/data -d asterisk:17``
