 #!/bin/bash

sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install oracle-java8-installer -y

wget --quiet http://www-eu.apache.org/dist/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz
tar zxf apache-flume-1.8.0-bin.tar.gz
