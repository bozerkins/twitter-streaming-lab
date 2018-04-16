#!/bin/bash

# setup java
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install oracle-java8-installer -y
sudo apt-get install oracle-java8-set-default

# setup libs
wget http://www-eu.apache.org/dist/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz
tar zxf apache-flume-1.8.0-bin.tar.gz

wget http://www-eu.apache.org/dist/lucene/solr/7.3.0/solr-7.3.0.tgz
tar zxf solr-7.3.0.tgz

wget http://www-us.apache.org/dist/hadoop/common/hadoop-3.1.0/hadoop-3.1.0.tar.gz
tar zxf hadoop-3.1.0.tar.gz

# add them to path
echo 'export PATH=$PATH:/home/vagrant/apache-flume-1.8.0-bin/bin/:/home/vagrant/solr-7.3.0/bin/:/home/vagrant/hadoop-3.1.0/bin/' >> ~/.bashrc
source ~/.bashrc

# add cloudera flume sources
mkdir ~/apache-flume-1.8.0-bin/plugins.d
mkdir ~/apache-flume-1.8.0-bin/plugins.d/twitter-streaming
mkdir ~/apache-flume-1.8.0-bin/plugins.d/twitter-streaming/lib
cp /vagrant/bin/flume-sources-1.0-SNAPSHOT.jar ~/apache-flume-1.8.0-bin/plugins.d/twitter-streaming/lib/flume-sources-1.0-SNAPSHOT.jar

# copy flume libs
 cp /vagrant/bin/solr-sink/* ~/apache-flume-1.8.0-bin/lib/

# grant everything
chown vagrant:vagrant -R .
