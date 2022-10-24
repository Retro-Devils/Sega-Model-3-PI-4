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
            1 "Install Model 3 " \
            2 "Model 3 Info   " \
            2>&1 > /dev/tty)

        case "$choice" in
            1) install_sm3  ;;
            2) info_sm3     ;;
            *) break       ;;
        esac
    done
}

function install_sm3(){
if [ -d "/opt/retropie/configs/emulators/supermodel" ]; then sudo rm -R /opt/retropie/emulators/supermodel/; fi
if [ -d "/opt/retropie/configs/model3" ]; then sudo rm -R /opt/retropie/configs/model3/; fi

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
sudo rm -f /opt/retropie/emulators/Supermodel.7z
sudo rm -f /opt/retropie/configs/Sega3-ES-Config.zip
echo "
--------------------------------
 Model 3 Install Complete
--------------------------------"
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title "SM3 EXIT OPTIONS " \
            --ok-label Select --cancel-label Exit-Installer \
            --menu "EDIT ES SYSTEMS.CFG ??" 25 40 40 \
            1 "YES EDIT /home/.emulationstation/es_system.cfg " \
            2 "NO DO NOT EDIT my file" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) edit-systemslist ;;
            2) finish-sm3    ;;
            *) break       ;;
        esac
    done
}

function edit-systemslist(){ 
if [ ! -s "$HOME/.emulationstation/es_systems.cfg" ]; then sudo rm -f $HOME/.emulationstation/es_systems.cfg; fi
if [ ! -f "$HOME/.emulationstation/es_systems.cfg" ]; then cp $HOME/.emulationstation/es_systems.cfg $HOME/RetroPie/retropiemenu/gamelist.xml; fi
CONTENT1="\t<system>\n\t\t  <name>model3</name>\n\t\t  <fullname>Sega Model 3</fullname> \n\t\t  <path>/home/pi/RetroPie/roms/model3</path> \n\t\t  <extension>.zip .ZIP</extension> \n\t\t<command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ model3 %ROM%</command> \n\t\t  <platform>model3</platform> \n\t\t  <theme>model3</theme> \n\t\t</system>"
C1=$(echo $CONTENT1 | sed 's/\//\\\//g')
if grep -q model3 "$HOME/.emulationstation/es_systems.cfg"; then echo "es_systems.cfg entry confirmed"
else
	sed "/<\/system>/ s/.*/${C1}\n&/" $HOME/.emulationstation/es_systems.cfg > $HOME/temp
	cat $HOME/temp > $HOME/.emulationstation/es_systems.cfg
	rm -f $HOME/temp
fi
}

function finisH_sm3(){
dialog  --sleep 1 --title "SM3 EXIT MESSAGE" --msgbox " 
THANKS FOR INSTALLING 
ADD YOUR ROMS TO HOME/PI/RETROPIE/ROMS/MODEL3
YOU WILL HAVE TO MANUALLY EDIT ES SYSTEMS.CFG

ENJOY
PLEASE REPORT ERRORS TO RETRO DEVILS " 0 0
}

function info_sm3(){
dialog  --sleep 1 --title "SM3 INFO MESSAGE" --msgbox " 
Sega Model 3 is an arcade platform released in 1996 as the successor to Sega Model 2. 
Model 3 continued several arcade games series established on previous Sega arcade boards.
With games such as; Daytona USA 2, Sega Rally 2, Virtua Fighter 3 and Star Wars Trilogy Arcade. 
------------------------------------------------------------------------
This installer setups Retropie to run Model 3" 0 0
}


sm3_menu
