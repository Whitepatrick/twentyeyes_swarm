https://mtalavera.wordpress.com/2015/02/16/monitoring-with-collectd-and-kibana/
---  
sudo apt-get update && sudo apt-get install -y collectd collectd-utils

elk swarm needs:
  - create docker-machine using virtualbox driver, call it keystore
  - consul running on created docker-machine keystore
  - create swarm master non-containers
    - look into swarm master best practices
    - eval swarm master machine and THEN bring up compose
  - OR: (compose w/o swarm?)
    - docker network create new-net
    - docker-compose --x-networking up -d _should_ bring them up using the same network that is defined in compose file (ie: net: "new-net")
    -



###########
https://docs.docker.com/swarm/install-w-machine/
sudo docker-machine create -d virtualbox elk
eval ''
eval 'dollarparensudo docker-machine env elk)'
sudo docker run swarm create
docker-machine create -d virtualbox --swarm --swarm-master --swarm-discovery token://2f80a8de0fed15b7c361d706dd0860fd swarm-master
docker-machine create -d virtualbox --swarm --swarm-discovery token://2f80a8de0fed15b7c361d706dd0860fd elastic-sb

##
create network first, then attach all containers to that network, keep off host

docker-compose --x-networking up -d
docker-compose file volumes can use double quotes
