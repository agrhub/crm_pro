#!/bin/bash

#start gateway
echo "Start gateway module"
cd ./gateway
APP_PATH=$(cd `dirname $0`; pwd)
echo "$APP_PATH"
rm -rf logs output.log
./72crm.sh "start"
sleep 10

#start authorization
echo "Start authorization module"
cd ../authorization
APP_PATH=$(cd `dirname $0`; pwd)
echo "$APP_PATH"
rm -rf logs output.log
./72crm.sh "start"
sleep 10

#start admin
echo "Start admin module"
cd ../admin
APP_PATH=$(cd `dirname $0`; pwd)
echo "$APP_PATH"
rm -rf logs output.log
./72crm.sh "start"
sleep 10

#start bi
echo "Start bi module"
cd ../bi
APP_PATH=$(cd `dirname $0`; pwd)
echo "$APP_PATH"
rm -rf logs output.log
./72crm.sh "start"
sleep 10

#start crm
echo "Start crm module"
cd ../crm
APP_PATH=$(cd `dirname $0`; pwd)
echo "$APP_PATH"
rm -rf logs output.log
./72crm.sh "start"
sleep 10

#start examine
echo "Start examine module"
cd ../examine
APP_PATH=$(cd `dirname $0`; pwd)
echo "$APP_PATH"
rm -rf logs output.log
./72crm.sh "start"
sleep 10

#start job
echo "Start job module"
cd ../job
APP_PATH=$(cd `dirname $0`; pwd)
echo "$APP_PATH"
rm -rf logs output.log
./72crm.sh "start"
sleep 10

#start oa
echo "Start oa module"
cd ../oa
APP_PATH=$(cd `dirname $0`; pwd)
echo "$APP_PATH"
rm -rf logs output.log
./72crm.sh "start"
sleep 10

#start work
echo "Start work module"
cd ../work
APP_PATH=$(cd `dirname $0`; pwd)
echo "$APP_PATH"
rm -rf logs output.log
./72crm.sh "start"
sleep 10

