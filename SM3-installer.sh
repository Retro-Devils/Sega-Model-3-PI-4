#!/bin/bash
echo "Sega Model 3 Installer By The Retro Devils "
sleep 5
##echo "Installing/Checking for dependenciez" 
sleep 1
echo "Installing p7zip"
sudo apt-get install  p7zip
echo "Install Finished"
echo 
sleep 2
echo"Beginning Sega Model 3 Install"
sleep 2 
cd /opt/retropie/emulators
wget https://mechafatnick.co.uk/CompiledEmus/SuperModel/supermodel.zip 
p7zip supermodel3.zip 
cd ~/
ln -s 
/opt/retropie/emulators/supermodel/bin/Config
Config 
ln -s 
/opt/retropie/emulators/supermodel/bin/NVRAM
NVRAM
chmod 755 -R /opt/retropie/emulators/supermodel/bin 
chmod 755 -R /home/pi/Config
echo "Model 3 Install Complete"
sleep 2
echo "For Sega Model 3 to show in Retropie
Please add this to ~/.emuationstation/es-systems.cfg
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



