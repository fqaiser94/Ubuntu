gitUrl=$1
gitUsername=$2
gitAccessToken=$3
notebookDir=$4

# download, extract, and move zeppelin
wget http://www-us.apache.org/dist/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz
tar xf zeppelin-0.8.1-bin-all.tgz -C /opt
mv /opt/zeppelin-0.8.1-bin-all /opt/zeppelin

# copy over templates
mv /opt/zeppelin/conf/zeppelin-env.sh.template /opt/zeppelin/conf/zeppelin-env.sh
echo 'export SPARK_HOME=/usr/lib/spark' >> /opt/zeppelin/conf/zeppelin-env.sh
cp -r templates/interpreter.json.template /opt/zeppelin/conf/interpreter.json
cp -r templates/zeppelin-site.xml.template /opt/zeppelin/conf/zeppelin-site.xml
sed -i "s|usp.git.remote.url|$gitUrl|g" /opt/zeppelin/conf/zeppelin-site.xml
#sed -i "s|usp.git.remote.username|$gitUsername|g" /opt/zeppelin/conf/zeppelin-site.xml
#sed -i "s|usp.git.remote.accessToken|$gitAccessToken|g" /opt/zeppelin/conf/zeppelin-site.xml
sed -i "s|uspNotebookDir|$notebookDir|g" /opt/zeppelin/conf/zeppelin-site.xml

# download gitUrl repo
git clone ${gitUrl} $notebookDir

# create zeppelin user and set permissions to folders
useradd -d /opt/zeppelin -s /bin/false zeppelin
chown -R zeppelin:zeppelin /opt/zeppelin
chown -R zeppelin:zeppelin $notebookDir
chmod -R 777 $notebookDir

# delete unnecessary files
rm zeppelin-0.8.1-bin-all.tgz

# setup zeppelin service
cp ./templates/zeppelin.service.template /etc/systemd/system/zeppelin.service
systemctl daemon-reload
systemctl start zeppelin
