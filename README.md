# Sega Model 3

## How did we do this ?

One line installer made with this tutorial. Props and credit to author. 

https://mechafatnick.co.uk/2021/06/13/becoming-a-super-model-adding-model-3-games-to-your-pi4/


## Install 

-in retropie press f4 and type 

 curl -sSL https://git.io/JS6DW | bash
 
 ## Working Games List 
 
 WORK IN PRGORESS
 
 
EVERYTHING BELOW IS TAKEN FROM 

https://mechafatnick.co.uk/2021/06/13/becoming-a-super-model-adding-model-3-games-to-your-pi4/



## Adding Artwork

I can’t give you complete guidance here as some themes are setup differently to others.

The theory is the same though.

First, navigate to your themes folder on your pi: /etc/emulationstation/themes/

Go into the subfolder for your theme (/etc/emulationstation/themes/crt in my case) and you should see a list of system names.

Download the MAME/Arcade entry.

Now, rename the downloaded file as ‘model3’. By default, this folder will use the MAME logo for your Model 3 games when you upload it to emulationstation. 
To change it look inside the folder. You should see a file called something like ‘system.svg’ open it and double check its the mame logo (if it isn’t keep looking at the contained image files until you find it.)

You can download a custom Model3 logo from here. Simply rename it so it has the same name as the MAME image you’ve found and overwrite it.

Now, upload the model3 folder you’ve created to your pi’s theme folder and you should be good to go.

## Adding Games

Addd your games to ~/RetroPie/roms/model3 


## Configuring the Controls

Supermodel has deep control customisations that allow you to set up controls for all games that have custom features. to configure inputs, plug a usb keyboard into your Pi (if you haven’t already) and type:

cd /opt/retropie/emulators/supermodel/bin ./supermodel -config-inputs

Follow the onscreen prompts to set the inputs to a controller of your choice. Please note that for racing games etc you’ll be able to set both generic gear up/gear down controls AND the option to change to different individual gears in individual games.


When you exit it should return you to the command prompt. 

I’ve made a small edit to the emulators source code so that you can alter the controls for exiting the emulator, taking screenshots, pausing games and messing with save states to give a more retroarch-like experience. 

If you want to set these (exiting the emulator is set to the escape key by default) open /opt/retropie/emulators/supermodel/bin/Config/Supermodel.ini in a text editor and set the inputs for these to the ones your prefer (if you’re unsure of which button number corresponds to which physical button, check the inputs you’ve already set. You can also use a ‘+’ between two inputs to set multi button combos.)







 

