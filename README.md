# YutOS

This is a simple Computercraft, Minecraft OS.
Created in the in-game computer using Lua!

![menu](https://cdn.discordapp.com/attachments/534033183008620569/1114047583640375427/image.png)
![upload](https://cdn.discordapp.com/attachments/534033183008620569/1114049223579676702/image.png)
![download](https://cdn.discordapp.com/attachments/534033183008620569/1114049174724431892/image.png)


## Installing

To install YutOS, open you Computercraft computer and write the following command:
```
pastebin run 14k7yk37
```
This runs the installer file which is also hosted in Pastebin (since Computercraft has Pastebin integration)

## Functionality
YutOS has:

 - Self installation (only one command needed)
 - Selecting and executing programs
 - Easy download and upload of programs (from and to floppy disc)*
	 >*Computer needs to be beside a disc reader
 - Clean UI

---
### Explanation

This OS was made with Lua inside  the game Minecraft using the Computercraft mod.
This was originally only uploaded to Pastebin, but I think it is relevant to upload it to github aswell.

The installer basically downloads all the required files from Pastebin:
```
...
get('startup.lua', 'xVCfrhV9') # get the code from 'www.pastebin.com/xVCfrhV9'
get('yututils.lua', 'cddT9hAW')
get('vt.lua', 'UvujEA68')
get('os/.menu', 'V2y6rPp3')
get('os/.install', 'G03iJSF8')
get('os/.programs', 'KxHLJ13E')
get('os/.cmd', 'aFfkyLzj')
...
```
All files that start with a  `.` are just hidden files inside the computer!
