#!/bin/sh

echo Git clone
git clone https://github.com/makermade/app-server
git clone https://github.com/makermade/system-server

echo Install dependencies
cd app-server
npm install
cd ..
cd system-server
npm install
cd ..

#echo Set workaround configuration
#cd system-server
#cat << EOF > ./lib/config.json
#{
#  "port" : 3000,
#  "directories" : {
#    "apps": "/data/local/wotapps/"
#   }
#}
#EOF
#cd ..

echo Patch network listener
cd app-server
patch -p1 -i listen.patch
cd..

echo Prepare device
adb shell mount -o remount,rw /system
adb shell rm -rf /system/lib/node_modules/haibu
adb shell rm -f /system/bin/haibu
adb shell mkdir /system/lib/node_modules/haibu
adb shell rm -rf /system/lib/node_modules/sysd
adb shell rm -f /system/bin/sysd
adb shell mkdir /system/lib/node_modules/sysd

echo Install app-server to device
cd app-server
adb push bin/ /system/lib/node_modules/haibu/bin
adb push lib/ /system/lib/node_modules/haibu/lib
adb push node_modules /system/lib/node_modules/haibu/node_modules
adb push config/ /system/lib/node_modules/haibu/config/
adb push package.json /system/lib/node_modules/haibu/
adb shell ln -s /system/lib/node_modules/haibu/bin/haibu /system/bin/haibu
cd ..

echo Install system-server to device
cd system-server
adb push bin/ /system/lib/node_modules/sysd/bin
adb push lib/ /system/lib/node_modules/sysd/lib
adb push node_modules /system/lib/node_modules/sysd/node_modules
#adb shell ln -s /system/lib/node_modules/sysd/bin/sysd /system/bin/sysd
cd ..

echo Install system-wide dependencies
cd system-server
adb shell mkdir /system/lib/node_modules/express
adb push node_modules/express/ /system/lib/node_modules/express
cd ..

echo Copy test-apps (with workaround for on-device issues)
cd system-server
adb shell mkdir /data/local/wotapps
adb push wotapps/ /data/local/wotapps
adb push wotapps/clock /data/local/haibu/apps/user/clock/app.js
adb push wotapps/gpio /data/local/haibu/apps/user/gpio/app.js
adb push wotapps/dialer /data/local/haibu/apps/user/dialer/app.js
cd ..

echo ... done
echo Installed. Using adb shell start
echo   (nodejs|node) /system/bin/haibu -a 0.0.0.0
echo   (nodejs|node) /system/bin/sysd
echo and open http://localhost:3000/ on device
