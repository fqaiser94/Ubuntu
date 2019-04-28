# install order
installDocker.sh  
installGit.sh  
installJava.sh  
installScala.sh  
installSbt.sh  
installSpark.sh  
installZeppelin.sh git.remote.url git.remote.username git.remote.access-token 
# e.g. sh installZeppelin.sh https:\\/\\/github.com\\/fqaiser94\\/zeppelin-notes.git fqasier94 accessToken  
installR.sh  
installPythonPackages.sh 

# zeppelin commands
systemctl start zeppelin
systemctl stop zeppelin
systemctl restart zeppelin
systemctl status zeppelin 
