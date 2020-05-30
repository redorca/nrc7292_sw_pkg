#!/bin/bash

if [ -d "/home/pi/nrc_pkg_bk" ]; then
 echo "Remove backup folder"
 rm -rf ~/nrc_pkg_bk
fi
if [ -d "/home/pi/nrc_pkg" ]; then
 echo "Backup previous package"
 mv ~/nrc_pkg ~/nrc_pkg_bk
fi
sleep 1

echo "Copy new package"
if [ "$1" == "dual" ]; then
 echo "apply nrc_pkg_dual "
 cp -r ./nrc_pkg_dual/  ~/nrc_pkg/
else
 echo "apply nrc_pkg "
 cp -r ./nrc_pkg/  ~/nrc_pkg/
fi

echo "Change mode"
cd ~/nrc_pkg
sudo chmod -R 755 *
sudo chmod -R 777 ~/nrc_pkg/script/*
sudo chmod -R 777 ~/nrc_pkg/sw/firmware/copy
sleep 1

echo "Done"
