# example usage: 
# sh installZeppelinMac.sh https://github.com/fqaiser94/zeppelin-notes.git fqaiser94 accessToken  ~/zeppelinNotes

# helpful link
# https://www.datageekinme.com/setup/setting-up-my-mac-zeppelin/

gitUrl=$1
gitUsername=$2
gitAccessToken=$3
notebookDir=$4

brew install apache-zeppelin

ZEPPELIN_HOME=/usr/local/Cellar/apache-zeppelin/0.8.1

# copy over templates
sudo mv $ZEPPELIN_HOME/libexec/conf/zeppelin-env.sh.template $ZEPPELIN_HOME/libexec/conf/zeppelin-env.sh
sudo echo 'export SPARK_HOME=~/spark' >> $ZEPPELIN_HOME/libexec/conf/zeppelin-env.sh
sudo cp -r templates/interpreter.json.template $ZEPPELIN_HOME/libexec/conf/interpreter.json
sudo cp -r templates/zeppelin-site.xml.template $ZEPPELIN_HOME/libexec/conf/zeppelin-site.xml
sudo sed -i '' "s|usp.git.remote.url|$gitUrl|g" $ZEPPELIN_HOME/libexec/conf/zeppelin-site.xml
sudo sed -i '' "s|uspNotebookDir|$notebookDir|g" $ZEPPELIN_HOME/libexec/conf/zeppelin-site.xml

# download gitUrl repo
git clone ${gitUrl} $notebookDir

echo 'export ZEPPELIN_HOME=/usr/local/Cellar/apache-zeppelin/0.8.1' >> /etc/profile
echo "alias zep-start='sudo $ZEPPELIN_HOME/bin/zeppelin-daemon.sh start'" >> /etc/profile
echo "alias zep-stop='sudo $ZEPPELIN_HOME/bin/zeppelin-daemon.sh stop'" >> /etc/profile
echo "alias zep-status='sudo $ZEPPELIN_HOME/bin/zeppelin-daemon.sh status'" >> /etc/profile
echo "alias zep-restart='sudo $ZEPPELIN_HOME/bin/zeppelin-daemon.sh restart'" >> /etc/profile

source /etc/profile
cd ~
zep-start
