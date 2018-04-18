#!/bin/bash
solr start -cloud -p 8983 -s "/home/vagrant/node1/solr"
solr start -cloud -p 7574 -s "/home/vagrant/node2/solr" -z localhost:9983
