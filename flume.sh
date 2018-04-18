# start flume
flume-ng agent -Xmx512m --conf ./conf/ --conf-file /vagrant/flume/twitter.conf --name TwitterAgent -Dflume.root.logger=DEBUG,console
