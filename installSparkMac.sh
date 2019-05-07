sparkVersion=2.4.1
hadoopVersion=2.7
wget https://archive.apache.org/dist/spark/spark-$sparkVersion/spark-$sparkVersion-bin-hadoop$hadoopVersion.tgz
tar xvf spark-$sparkVersion-bin-hadoop$hadoopVersion.tgz
mv spark-$sparkVersion-bin-hadoop$hadoopVersion ~/spark

echo 'export SPARK_HOME=~/spark' >> /etc/profile
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> /etc/profile

rm spark-$sparkVersion-bin-hadoop$hadoopVersion.tgz
