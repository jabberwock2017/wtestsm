#!/bin/bash

#docker info


echo "/usr/bin/ssh-keygen -q -P  -f ~/.ssh/id_rsa"
/usr/bin/ssh-keygen -q -P "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

sudo chown -R travis ~
#echo "--ssh---"
ssh -o StrictHostKeyChecking=no localhost ls -l /home/travis/wtestsm/wtest
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

sed -e "s;- set_fact: src_dir=\"{{ ansible_wd.stdout }}/wtestsm\";- set_fact: src_dir=$TRAVIS_BUILD_DIR;" <test.yml.template > t.yml
mv t.yml test.yml.template

apt list |sort
echo "-----------------------------------------"
