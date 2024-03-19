# Launching your WSL2 Distro

Option 1:  `Start menu -> Ubuntu`

Option 2: On PowerShell type `wsl`

### Launch the default distribution (marked with *)

`wsl`

### Launch a specific distribution

`wsl -d Ubuntu-20.04`

### Browsing WSL files from Windows

* Option 1

    In your browser paste:

    `file://///wsl$/Ubuntu-20.04/home/`

* Option 2

    In a WSL terminal type:

    `explorer.exe .`

### Accessing Windows locations from WSL2

`ls -l /mnt/c`

## Useful WSL commands

### Check what distributions are available

`wsl --list --online`

### Check to see what distributions are installed

`wsl --list --verbose`

### Remove a distribution

`wsl --unregister <distro name>`

### Test to see what is currently running

`wsl -l -v`

### Shut things down

`wsl --shutdown`

### Terminate a specific distro

`wsl -t <distro name>`
