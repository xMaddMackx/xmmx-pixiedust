---  __    __  __       __  __       __  __    __         ______    ______   _______   ______  _______  ________   ______  -----
--  |  \  |  \|  \     /  \|  \     /  \|  \  |  \       /      \  /      \ |       \ |      \|       \|        \ /      \  ----
--  | $$  | $$| $$\   /  $$| $$\   /  $$| $$  | $$      |  $$$$$$\|  $$$$$$\| $$$$$$$\ \$$$$$$| $$$$$$$\\$$$$$$$$|  $$$$$$\  ---
---  \$$\/  $$| $$$\ /  $$$| $$$\ /  $$$ \$$\/  $$      | $$___\$$| $$   \$$| $$__| $$  | $$  | $$__/ $$  | $$   | $$___\$$  ---
----  >$$  $$ | $$$$\  $$$$| $$$$\  $$$$  >$$  $$        \$$    \ | $$      | $$    $$  | $$  | $$    $$  | $$    \$$    \  ----
---  /  $$$$\ | $$\$$ $$ $$| $$\$$ $$ $$ /  $$$$\        _\$$$$$$\| $$   __ | $$$$$$$\  | $$  | $$$$$$$   | $$    _\$$$$$$\  ---
--  |  $$ \$$\| $$ \$$$| $$| $$ \$$$| $$|  $$ \$$\      |  \__| $$| $$__/  \| $$  | $$ _| $$_ | $$        | $$   |  \__| $$  ---
--  | $$  | $$| $$  \$ | $$| $$  \$ | $$| $$  | $$       \$$    $$ \$$    $$| $$  | $$|   $$ \| $$        | $$    \$$    $$ ----
---  \$$   \$$ \$$      \$$ \$$      \$$ \$$   \$$        \$$$$$$   \$$$$$$  \$$   \$$ \$$$$$$ \$$         \$$     \$$$$$$ -----


#   DEPENDENCIES:
    • emote system (uses ExecuteCommand('e emoteName') to execute some of the animations but can be adapted to use an event like TaskPlayAnim(...))
    • ox_lib (for progress circle and notification but can be adapted to your utilities.)
    • interact-sound (for the cool sound effects, but optional.)

#   This simple script is the basis of a BIGGER script that I am working on. For the time being, and with this version, I needed a way to control the weapons
#   in my server as well as provide untraditional access to the money laundromat. Something unique, and fun at the same time! This script creates a mystery pouch that
#   players on my server are able to randomly find by doing various tasks in the server, such as prospecting, recycling, etc. Opening the pouch gives you random Pixie
#   Dusts that can be used to travel to mystery places! Places that you can only get to by using the dust! Sound effects added to hint as to where the player will end
#   up! This script is dependent on a Money Wash Script and a Gun Crafting script that is setup to use the IPL Gun Bunker and Money Laundry but totally configurable for
#   whatever reasons or places you need it for!


#  INSTRUCTIONS:
    •  Add the images from the images folder to your inventory images folder (or create your own images).
    •  Add the sound files to interact-sound/client/html/sounds (If too loud, adjust the volume values in xmmx-pixiedust/client/main.lua).
    •  If you're not using ox_lib then delete the '@ox_lib/init.lua' from the fxmanifest.lua of this script.

```lua

    -- Add this line to qb-smallresources/server/logs.lua replacing 'WBHOOK_HERE' with yours! (optional, just remove the qb-logs portion in xmmx-pixiedust/client.lua)

    ['pixiedust'] = 'WEBHOOK_HERE',


    --- Add the items below to qb-core/shared/items.lua

    ['mythicalpouch']       = {['name'] = 'mythicalpouch',      ['label'] = 'Mythical Pouch',       ['weight'] = 500,    ['type'] = 'item',    ['image'] = 'mythicalpouch.png',     ['unique'] = false,    ['useable'] = true,    ['shouldClose'] = true,    ['combinable'] = nil,      ['description'] = 'A Rare Mythical Pouch...'},
    ['pixiedust']           = {['name'] = 'pixiedust',          ['label'] = 'Pixie Dust',           ['weight'] = 500,    ['type'] = 'item',    ['image'] = 'pixiedust.png',         ['unique'] = false,    ['useable'] = true,    ['shouldClose'] = true,    ['combinable'] = nil,      ['description'] = 'Sniff this to see where it takes you!'},
    ['pixiedust2']          = {['name'] = 'pixiedust2',         ['label'] = 'Pixie Dust',           ['weight'] = 500,    ['type'] = 'item',    ['image'] = 'pixiedust2.png',        ['unique'] = false,    ['useable'] = true,    ['shouldClose'] = true,    ['combinable'] = nil,      ['description'] = 'Sniff this to see where it takes you!'},

```