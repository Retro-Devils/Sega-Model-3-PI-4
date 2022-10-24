#!/bin/bash

brst="$(tput sgr0)"
fgred="${rst}$(tput setaf 1)" # Red
bld="$(tput bold)"
bfgred="${bld}$(tput setaf 1)"

function sm3_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title "SEGA MODEL 3 INSTALLER V1.2 " \
            --ok-label Select --cancel-label Exit-Installer \
            --menu "MODEL 3 INSTALLER" 25 40 40 \
            1 "Install/Update Devils Box " \
            2 "Devils Box Info   " \
            2>&1 > /dev/tty)

        case "$choice" in
            1) install_sm3  ;;
            2) info_sm3     ;;
            *) break       ;;
        esac
    done
}

function install_sm3(){
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
sudo wget https://archive.org/download/DB-EMUS/Model%203/Supermodel.7z
sudo p7zip -d  Supermodel.7z
cd /opt/retropie/configs
sudo wget https://archive.org/download/DB-EMUS/Model%203/Sega3-ES-Config.zip
sudo unzip Sega3-ES-Config.zip
cd ~/
sudo ln -s /opt/retropie/emulators/supermodel/bin/Config Config 
sudo ln -s /opt/retropie/emulators/supermodel/bin/NVRAM NVRAM
sudo chmod 755 -R /opt/retropie/emulators/supermodel/bin 
sudo chmod 755 -R ~/Config
mkdir ~/RetroPie/roms/model3
sleep 1
sudo rm -r ~/Config/Games.xml 
sudo rm -r /opt/retropie/emulators/supermodel/bin/Config/Games.xml
sleep 1
sudo wget https://archive.org/download/DB-EMUS/Games.xml -P ~/Config/
sudo cp ~/Config/Games.xml -f /opt/retropie/emulators/supermodel/bin/Config/
sleep 1 
echo "
--------------------------------
 Model 3 Install Complete
--------------------------------"
sleep 2
sudo rm -f /opt/retropie/emulators/Supermodel.7z
sudo rm -f /opt/retropie/configs/Sega3-ES-Config.zip
dialog  --sleep 1 --title "SM3 EXIT MESSAGE" --msgbox " 
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
----------------------------------------
Add Your Roms To ~/RetroPie/roms/model3/
----------------------------------------" 0 0
sleep 5

echo "Drugs are bad mmmkay " 
sleep 2
echo "Thanks for using have a wonderful and retro day" 
sleep 5
}

function info_sm3(){
blah blah 
hold place here 
}


sm3_menu
