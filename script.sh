#!/bin/bash

apt-get install gcc -y
apt-get install gcc++ -y
apt-get install make -y

apt-get install bison -y

apt-get install openssl -y 

apt-get install libssl -y

apt-get install libssl-dev -y

apt-get install libeditline0 -y

apt-get install libeditline-dev -y

apt-get install libedit-dev -y

apt-get install libedit2 -y

apt-get install libncurses5 -y

apt-get install libncurses5-dev -y

apt-get install zlib1g-dev -y


#Installer build-essential
apt-get install build-essential -y

#Installer les kernel header
apt-get install linux-headers-$(uname -r) -y

apt-get install libnewt-dev -y

apt-get install libsqlite3-dev -y

apt-get install libsqlite3-0 -y

apt-get install uuid-dev -y

apt-get install uuid -y

#wget asterisk
cd /usr/local/src
wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-15-current.tar.gz
tar -zxf asterisk-15-current.tar.gz

#PJSIP-pjproject
cd /usr/local/src/asterisk-15.3.0/contrib/scripts/
./install_prereq install

cd /usr/local/src/asterisk-15.3.0
./configure --with-pjproject-bundled

cd /usr/local/src/
make
make install
sleep 5
make config

cd /usr/local/src/asterisk-15.3.0
./configure
make menuselect.makeopts
menuselect/menuselect --enable CORE-SOUNDS-FR-GSM --enable CORE-SOUNDS-EN-GSM --enable CORE-SOUNDS-FR-ULAW --enable CORE-SOUNDS-EN-ULAW --enable EXTRA-SOUNDS-FR-GSM --enable EXTRA-SOUNDS-EN-GSM --enable EXTRA-SOUNDS-FR-ULAW --enable EXTRA-SOUNDS-EN-ULAW  --enable EXTRA-SOUNDS-FR-ULAW --enable EXTRA-SOUNDS-FR-ULAW   --enable aelparse --enable app_meetme --enable MOH-OPSOUND-ULAW --enable MOH-OPSOUND-GSM  --enable chan_sip menuselect.makeopts
make
make install
sleep 5
make samples
make config

sleep5

/etc/init.d/asterisk status
