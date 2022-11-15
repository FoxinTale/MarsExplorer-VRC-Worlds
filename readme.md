# Mars Explorer VR Chat worlds.

This is a master repository of worlds ported from a long since dead game called Mars Explorer, into VR Chat. Partially to share with the world, partially as a content backup because I don't trust my PC sometimes. 

### What was this game?
Mars Explorer was a multiplayer online game consisting of many user made worlds, where you as the player could drive around on a world in a buggy (which could also fly via gliding), a fighter jet, an alien tank or hovercraft. It also had a laser tag mechanic where you could "tag" the other players. 

Now, this game was around from around 2009 to 2015, when the servers shut down and the world links began to rapidly decay. Now, 10+ years later, there are a handful of worlds left from what there used to be. 

As the servers shut down there was functionally no easy way to paly the game with friends. This is an attempt, utilizing Saccan's flight and vehicles project to at least somewhat revive the game.

This game formed part of my childhood and got me interested in the field of game design and computer science (and I know I'm not alone in this), so I am doing what I can to bring what's left of the game into a modern-ish, relevant game. 


### How are you doing this?
Some worlds have been saved and archived [here](https://gitea.moe/lamp/map.syn3h.com-mirror/src/branch/modified/map.syn3h.com.s3.amazonaws.com) and [here](https://gitea.moe/lamp/whirlds/src/branch/master/marsxplr).

I download the repositories and used [utiny Ripper](https://github.com/mafaca/UtinyRipper) to extract the assets from each world.  The extracted textures, since this is such an old game, for the most part need to be ran through an AI upscaler, and then cleaned up or denoised afterwards.  Once that is done though, I more or less just create a new project in Unity and drag/drop the assets over.

Most of the time I need to change the shader of the materials used, as it shows up as "missing" due to the game being made on Unity 3 or something of the like, and VRC running on Unity 2019, the shaders don't exist anymore. 


### Can I help?
Sure! If you want to do any modifications, you will first need to download and install the VR Chat Creator Companion. Create a new world project (I would suggest naming it what the world is) and add UdonSharp once VCC does its thing. 

Open the project and wait for everything to compile / download. Once done, download this repository and go into the world folder  of your choice. Drag and drop all the contents to the assets window in Unity. Wait for it to import (shouldn't take long).

Now, import the latest release of [Sacc Flight and Vehicles](https://github.com/Sacchan-VRC/SaccFlightAndVehicles) into the window, as its assets are used. Once that is done, open the scene folder and drag the item in there to the heirarchy panel (default on the left side) within Unity. right click the "untitled" and select "unload scene". And that's it. 

Note, that you can build and est these worlds all you want, but will probably encounter issues trying to upload if VRC's SDK is being incompetent. 