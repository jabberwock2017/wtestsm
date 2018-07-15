#!/bin/bash

#docker info


echo "/usr/bin/ssh-keygen -q -P  -f ~/.ssh/id_rsa"
/usr/bin/ssh-keygen -q -P "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

sudo chown -R travis ~

ssh -o StrictHostKeyChecking=no localhost pwd

sudo service docker stop
sudo pip uninstall docker docker-py docker-compose
sudo pip uninstall docker python
#sudo pip install docker-py
sudo pip install docker-compose
sudo pip install ansible
sudo service docker start

echo "****************"
sudo pip list | sort
echo "****************"

sed -e "s;- set_fact: src_dir=\"{{ ansible_wd.stdout }}/wtestsm\";- set_fact: src_dir=$TRAVIS_BUILD_DIR;" <test.yml.template > t.yml
mv t.yml test.yml.template

( cd  /home/travis/build/jabberwock2017/wtestsm/wtest ; docker-compose build; docker-compose up --scale wtestbackend=3 ; )
