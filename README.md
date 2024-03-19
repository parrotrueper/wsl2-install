# Install WSL2 Ubuntu Focal Fossa on Windows 10

## Check that your Windows machine meets the prerequisites

You must be running **Windows 10 version 2004 and higher (Build 19041 and higher)**

If you are on an earlier version check [https://learn.microsoft.com/en-us/windows/wsl/install-manual](https://learn.microsoft.com/en-us/windows/wsl/install-manual) out.

## WSL2 Installation

### Part 1

1. Clone this repository somewhere in your `C:\` drive. For example `C:\here\`
2. Open a PowerShell terminal as <span style="color:red">administrator</span>,
navigate to the clone of this repository. Run the following script.

     `part1.bat`
     
3. Reboot your machine.

### Part 2

Open a Powershell terminal as a <span style="color:red">regular user</span>,
navigate to the clone of this repository. Run the following script.

`part2.bat`

### Part 3 Git credentials (HTTPS)

*If you use Git with SSH you can skip this part.*

If you authenticate with https on Git repositories then you need Part 3.

1. Install [Git Credential Manager on Windows](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md#windows). 
2. Launch a WSL2 terminal. `Start Menu->Ubuntu`

From the *WSL terminal* run the following script.

```bash
$ /mnt/c/here/wsl2-install/part3.sh
```


## Sharing USB devices between Windows and WSL

1. Install usbipd-win. Open a Powershell terminal as a <span style="color:red">regular user</span>, 
navigate to the clone of this repository. Run the following script.

     `usb-setup.bat`

2. Reboot your machine.

3. Install usbip client. 

     From the WSL terminal execute the part3 script as follows:

     ```bash
     $ /mnt/c/here/wsl2-install/usb-share-wsl.sh
     ```


### List devices connected to Windows

Open a PowerShell terminal as **administrator**

`usbipd list`

Make a note of the `BUSID` of the device you want access to from WSL. To bind 
the device, use the following command replacing `<busid>` for the bus ID of the 
desired device.

`usbipd bind --busid <busid>`

Launch WSL

Open a new PowerShell terminal as a **regular user**.

`usbipd attach --wsl --busid <busid>`

On the WSL Linux terminal type

`lsusb`

The USB device should now be available on WSL

## GUI applications launched from WSL

Check what graphics card you have and install the latest drivers for vGPU.

`Device Manager -> Display adapters`

[Intel](https://www.intel.com/content/www/us/en/download/19344/intel-graphics-windows-dch-drivers.html)

[AMD](https://www.amd.com/en/support)

[nvidia](https://www.nvidia.co.uk/Download/index.aspx?lang=en-uk)

Open a PowerShell windows and update WSL

`wsl --update`

### Visual Code Fans

Install the WSL extension on Windows Visual Code, then on your WSL2 terminal you 
can launch it by typing:

`code .`

## Resources

[Microsoft WSL install](https://learn.microsoft.com/en-us/windows/wsl/install)

[Microsoft Working across filesystems](https://learn.microsoft.com/en-us/windows/wsl/filesystems)

[Docker Engine Install](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
