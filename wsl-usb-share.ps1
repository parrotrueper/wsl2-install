
#get usbipd-win

Invoke-WebRequest https://github.com/dorssel/usbipd-win/releases/download/v4.0.0/usbipd-win_4.0.0.msi -OutFile usbipd-win.msi

# install it

.\usbipd-win.msi

Remove-Item usbipd-win.msi

$Output = $wshell.Popup("usbipd-win done  Please reboot your machine.",0,"USB sharing installation",0)

