FROM ubuntu:18.04

COPY . scripts/

RUN cd scripts \
	&& sh installBashPkgs.sh \
	&& sh installGit.sh \
	&& sh installJava.sh \
	#&& sh installSpark.sh \ 
	&& sh installZeppelin.sh https://github.com/hortonworks-gallery/zeppelin-notebooks.git git.remote.username git.remote.access-token /home/zeppelinNotes 
