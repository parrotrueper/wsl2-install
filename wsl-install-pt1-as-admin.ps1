#Requires -RunAsAdministrator

# Enable Virtual Machine and Hypervisor
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Compression is linked to WSL2 disconnecting which is very annoying, you can disable this by
fsutil behavior set disablecompression 1

$wshell = New-Object -ComObject Wscript.Shell
$Output = $wshell.Popup("Part 1 done.  Please reboot your machine.",0,"WSL Installation",0)
