#!/bin/bash



echo start build


if [ -f ~/local/bin/erl ]
then
	echo 'Found erlang build'
else
	echo 'Installing erlang'
	wget http://www.erlang.org/download/otp_src_R16A_RELEASE_CANDIDATE.tar.gz
	tar xvf otp_src_R16A_RELEASE_CANDIDATE.tar.gz
	cd otp_src_R16A
	./configure --without-javac --prefix=/home/dotcloud/local
	make -j4
	make install
	cd ..
fi

if [ -d ~/rabbitmq_server-3.0.2 ]
then
	echo 'Found rabbitmq build'
else
	echo 'Installing rabbitmq'
	wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.0.2/rabbitmq-server-generic-unix-3.0.2.tar.gz
	tar xvf rabbitmq-server-generic-unix-3.0.2.tar.gz
	cp -a rabbitmq_server-3.0.2 ~
fi

cp run ~


