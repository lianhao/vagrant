#!/bin/bash

#install java8
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo apt-get install oracle-java8-installer -y
sudo update-java-alternatives -s java-8-oracle
sudo apt-get install oracle-java8-set-default -y

#install mvn
sudo mkdir -p /usr/local/apache-maven
wget http://ftp.wayne.edu/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
sudo tar -xzvf apache-maven-3.3.9-bin.tar.gz -C /usr/local/apache-maven/
sudo update-alternatives --install /usr/bin/mvn mvn /usr/local/apache-maven/apache-maven-3.3.9/bin/mvn 1
sudo update-alternatives --config mvn

#install misc
sudo apt-get install npm vim git git-review diffstat -y

export M2_HOME=/usr/local/apache-maven/apache-maven-3.3.9
export MAVEN_OPTS="-Xms256m -Xmx512m" # Very important to put the "m" on the end
export JAVA_HOME=/usr/lib/jvm/java-8-oracle # This matches sudo update-alternatives --config java

mkdir ~/.m2
git clone http://github.com/opendaylight/odlparent
cp odlparent/settings.xml ~/.m2

git clone http://github.com/opendaylight/netvirt
cd netvirt; mvn clean install -nsu -DskipTests;
#cd /home/vagrant/netvirt/netvirt-karaf/target/assembly; echo "log4j.logger.org.opendaylight.netvirt = DEBUG,stdout" >> etc/org.ops4j.pax.logging.cfg; rm -rf journal snapshots; bin/karaf clean
