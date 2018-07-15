#!/bin/bash

#docker info

echo -n "WD: "
pwd

echo "/usr/bin/ssh-keygen -q -P  -f ~/.ssh/id_rsa"
/usr/bin/ssh-keygen -q -P "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

sudo chown -R travis ~
#echo "--ssh---"
ssh -o StrictHostKeyChecking=no localhost pwd
#echo "-------"

sudo service docker stop
echo "****************"
sudo pip list
echo "****************"
sudo pip uninstall docker docker-py docker-compose
sudo pip uninstall docker python
#sudo pip install docker-py
sudo pip install docker-compose
sudo service docker start
sudo pip install ansible
