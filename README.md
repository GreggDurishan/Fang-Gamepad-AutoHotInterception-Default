# AutoHotInterception script to restore default labled button behavior for Ideazon Fang gamepad in Win10/11

[![Video Guide](https://img.youtube.com/vi/ScVpzwB4eOw/0.jpg)](https://www.youtube.com/watch?v=ScVpzwB4eOw)  
(Youtube guide to installation: https://www.youtube.com/watch?v=ScVpzwB4eOw)  

The Fang gamepad's software stopped working with Windows midway through Win10's lifespan. Without it, the Fang's keys don't work as labled, nor is it easy to remap the keys correctly for specifically just the Fang and not all keyboards on a computer. AutoHotInterception--which uses AutoHotKey--is a working solution, and in this video I walk you through its installation, then provide a custom mapping .AHK that will get the Fang back behaving as intended. From there you can use the template to create your own custom mappings or turn the Fang into a multimedia keyboard, launching programs and running macros.

Instruction text used in the video:

Use the largely-correct install instructions on the AutoHotInterception GitHub page: https://github.com/evilC/AutoHotInterception

It will direct you to three downloads:
- AutoHotKey, currently v2.0 (https://www.autohotkey.com/), a keyboard remapper/macroer
- AutoHotInterception itself, currently v0.9.1 (https://github.com/evilC/AutoHotInterception/releases), which lets you map a specific keyboard
- Interception, currently v1.0.1 (https://github.com/oblitum/Interception/releases), a tool necessary for AutoHotInterception to work

First, install AutoHotKey via its installer exe.

Then follow the AutoHotInterception GitHub page's instructions under the "Setup" header.

For step 2, choose the "AHK v2" folder as your working folder, and not "AHK v1" (for AutoHotKey v1).

When you get to part 4: "Right-click Unblocker.ps1 in the lib folder and select Run as Admin.", do the following instead:
- Open a powershell window as admin
- Navigate to the folder with Unblocker.ps1
- Run the following command: ```Set-ExecutionPolicy -ExecutionPolicy Unrestricted```
- Run Unblocker.ps1
- Run the following command: ```Set-ExecutionPolicy -ExecutionPolicy Restricted```
- Close out
(It's not usually smart to run strange scripts like this, you can read the contents of Unblocker.ps1 to see it's simple & not malicious itself. It imparts an elevated level of trust to the dlls in the folders below, so you're trusting those strange dlls too. I've had no issue.)

For step 5, running Monitor.ahk, set up the file association by right-clicking, open as, and set a default to the appropriate autohotkey exe. As a 64bit win11 US keyboard user without need for unicode, I use AutoHotkey64.exe, which I think is the default.

After step 5:

Copy the contents of your working folder (should be "AHK v2") to a new folder: C:\Program Files\AutoHotInterception\

Copy Monitor.ahk from that folder to a new folder someplace convenient for you to put your config files. (I use Desktop\Gamepad Configs)  
Edit the copy you made of Monitor.ahk and change the line near the top:  
 ```#include Lib\AutoHotInterception.ahk```  
to  
 ```#include c:\Program Files\AutoHotInterception\Lib\AutoHotInterception.ahk```  

Download, extract, and place in that same folder the FangDefault.ahk that I provide: https://github.com/GreggDurishan/Fang-Gamepad-AutoHotInterception-Default/releases  
Use Monitor.ahk to identify which keyboard your Fang is.  
Use the copy button to get the keyboard ids for your Fang.  
Edit FangDefault.ahk, change  
 ```AHI.GetKeyboardId(0x1038, 0x0310, 1)```  
to whichever 0x codes your Fang identifies as using Monitor.ahk, and save the file.  

If you want this to autolaunch when windows starts:  
 - Run "shell:startup" in the windows run dialog box
 - Rightclick, new shortcut, and point it at the AHK you want to run on launch.

