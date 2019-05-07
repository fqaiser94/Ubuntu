# Ubuntu 

## install order
```
installDocker.sh  
installGit.sh  
installJava.sh  
installScala.sh  
installSbt.sh  
installSpark.sh  
installZeppelin.sh git.remote.url git.remote.username git.remote.access-token cloneNotebooksToDir
# e.g. sh installZeppelin.sh https:\\/\\/github.com\\/fqaiser94\\/zeppelin-notes.git fqaiser94 accessToken  ~/
installR.sh  
installPythonPackages.sh 
```

## zeppelin commands
```
systemctl start zeppelin
systemctl stop zeppelin
systemctl restart zeppelin
systemctl status zeppelin 
```

# Mac 

## install order
```
sh installJavaMac.sh  
sh installSparkMac.sh  
sh installZeppelinMac.sh git.remote.url git.remote.username git.remote.access-token cloneNotebooksToDir
```

## zeppelin commands
```
zep-start
zep-stop
zep-restart
zep-status
```

