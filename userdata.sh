#!/bin/bash
apt-get update
apt-get -y install git
apt-get -y install binutils
git clone https://github.com/aws/efs-utils
cd efs-utils
./build-deb.sh
apt-get -y install ./build/amazon-efs-utils*deb
cd /
mkdir efs
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-7e7300b4.efs.eu-west-1.amazonaws.com:/ efs
apt-get install -y docker.io
systemctl enable docker
systemctl start docker
docker run --name jenkins -p 8080:8080 -p 50000-50010:50000-50010 \
  -v /var/run/docker.sock:/var/run/docker.sock -v /efs/jenkins_home:/var/jenkins_home \
  dklocek/jpd:latest &
docker update --restart=always jenkins
docker start jenkins