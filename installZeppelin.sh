wget http://www-us.apache.org/dist/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz
tar xf zeppelin-*-bin-all.tgz -C /opt
mv /opt/zeppelin-*-bin-all /opt/zeppelin
mv /opt/zeppelin/conf/zeppelin-env.sh.template /opt/zeppelin/conf/zeppelin-env.sh
echo 'export SPARK_HOME=/usr/lib/spark' >> ~/opt/zeppelin/conf/zeppelin-env.sh
rm zeppelin-0.8.1-bin-all.tgz

useradd -d /opt/zeppelin -s /bin/false zeppelin
chown -R zeppelin:zeppelin /opt/zeppelin
cp zeppelin.service.template /etc/systemd/system/zeppelin.service
systemctl start zeppelin
