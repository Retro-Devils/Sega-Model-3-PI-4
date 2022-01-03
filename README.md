# Sega Model 3

## Howd we do this ?

One line installer made with this tutorial. Props and credit to author. 

https://mechafatnick.co.uk/2021/06/13/becoming-a-super-model-adding-model-3-games-to-your-pi4/


## Install 

-in retropie press f4 and type 

 curl -sSL https://git.io/JS6DW | bash
 
 
 
 Adding Artwork

I can’t give you complete guidance here as some themes are setup differently to others.

The theory is the same though.

First, navigate to your themes folder on your pi: /etc/emulationstation/themes/

Go into the subfolder for your theme (/etc/emulationstation/themes/crt in my case) and you should see a list of system names. Download the MAME/Arcade entry.
Now, rename the downloaded file as ‘model3’. By default, this folder will use the MAME logo for your Model 3 games when you upload it to emulationstation. To change it look inside the folder. You should see a file called something like ‘system.svg’ open it and double check its the mame logo (if it isn’t keep looking at the contained image files until you find it.)
You can download a custom Model3 logo from here. Simply rename it so it has the same name as the MAME image you’ve found and overwrite it. Now, upload the model3 folder you’ve created to your pi’s theme folder and you should be good to go.


 

