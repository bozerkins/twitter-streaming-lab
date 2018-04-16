#!/bin/bash

sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install oracle-java8-installer -y
sudo apt install oracle-java8-set-default

wget http://www-eu.apache.org/dist/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz
tar zxf apache-flume-1.8.0-bin.tar.gz

wget http://www-eu.apache.org/dist/lucene/solr/7.3.0/solr-7.3.0.tgz
tar zxf solr-7.3.0.tgz

wget http://www-us.apache.org/dist/hadoop/common/hadoop-3.1.0/hadoop-3.1.0.tar.gz
tar zxf hadoop-3.1.0.tar.gz
