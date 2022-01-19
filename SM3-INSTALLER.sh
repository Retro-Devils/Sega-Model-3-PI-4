#!/bin/bash
echo "_____________________________________________
Sega Model 3 Installer By The Retro Devils
Version 1.1"
echo " Built For Pi 4 Press Control+C to cancel Now
-------------------------------------"
sleep 5
echo "
Installing/Checking For Dependencies
-------------------------------------" 
sleep 1
echo "Installing P7Zip"
sudo apt-get install -y p7zip
echo "Installing unzip"
sudo apt-get install -y unzip
echo "Installing LibSDl2-Net"
sudo apt-get install -y libsdl2-net-dev
echo "
-----------------------------
Dependencies Install Finished
-----------------------------"
sleep 2
echo "
--------------------------------
 Begin Model 3 Install 
--------------------------------"
cd /opt/retropie/emulators
sudo wget https://archive.org/download/DB-EMUS/Supermodel.7z
sudo p7zip -d  Supermodel.7z
cd /opt/retropie/configs
sudo wget https://archive.org/download/DB-EMUS/Sega3-ES-Config.zip
sudo unzip Sega3-ES-Config.zip
cd ~/
sudo ln -s /opt/retropie/emulators/supermodel/bin/Config Config 
sudo ln -s /opt/retropie/emulators/supermodel/bin/NVRAM NVRAM
sudo chmod 755 -R /opt/retropie/emulators/supermodel/bin 
sudo chmod 755 -R ~/Config
mkdir ~/RetroPie/roms/model3
sudo wget https://archive.org/download/DB-EMUS/Games.xml -P ~/Config/
echo "
--------------------------------
 Model 3 Install Complete
--------------------------------"
sleep 2
sudo rm -f /opt/retropie/emulators/Supermodel.7z
sudo rm -f /opt/retropie/configs/Sega3-ES-Config.zip
echo "
-------------------------------------
For Sega Model 3 To Show In Retropie
-------------------------------------"
echo "
Please Add Below To ~/.emuationstation/es-systems.cfg
<system> 
  <name>model3</name> 
  <fullname>Sega Model 3</fullname> 
  <path>/home/pi/RetroPie/roms/model3</path> 
  <extension>.zip .ZIP</extension> 
<command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ model3 %ROM%</command> 
  <platform>arcade</platform> 
  <theme>model3</theme> 
  <directlaunch/> 
</system>"
echo "
----------------------------------------
Add Your Roms To ~/RetroPie/roms/model3/
----------------------------------------"

sleep 5

echo "Drugs are bad mmmkay " 
sleep 2
echo "Thanks for using have a wonderful and retro day" 
sleep 5



