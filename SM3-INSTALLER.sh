#!/bin/bash
echo "
_____________________________________________
Sega Model 3 Installer By The Retro Devils
_____________________________________________
Built For Pi 4 Press Control+C to cancel Now
_____________________________________________"

sleep 6
echo "
-------------------------------------
Installing/Checking For Dependencies
-------------------------------------" 
sleep 1
echo "Installing unzip"
sudo apt-get install  unzip
echo "
-----------------------------
Dependencies Install Finished
-----------------------------"
sleep 2
cd /opt/retropie/emulators
sudo wget https://archive.org/download/DB-EMUS/supermodel.7z
sudo unzip supermodel.zip 
cd ~/
ln -s /opt/retropie/emulators/supermodel/bin/Config Config 
ln -s /opt/retropie/emulators/supermodel/bin/NVRAM NVRAM
sudo chmod 755 -R /opt/retropie/emulators/supermodel/bin 
sudo chmod 755 -R /home/pi/Config
mkdir ~/RetroPie/roms/model3
echo"
--------------------------------
 Model 3 Install Complete"
--------------------------------"
sleep 2
sudo rm -f /opt/retropie/emulators/supermodel.7z
echo"
-------------------------------------
For Sega Model 3 To Show In Retropie
-------------------------------------
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
</system>
"
sleep 5
----------------------------------------
Add Your Roms To ~/RetroPie/roms/model3/
----------------------------------------"

echo "Drugs are bad mmmkay " 
sleep 2
echo "Thanks for using have a wonderful and retro day" 
sleep 5



