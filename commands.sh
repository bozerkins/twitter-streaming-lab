# start flume
bin/flume-ng agent --conf ./conf/ --conf-file /vagrant/flume/twitter.conf --name TwitterAgent -Dflume.root.logger=INFO,console
