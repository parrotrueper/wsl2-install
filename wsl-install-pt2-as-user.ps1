# this script should be run as a non privileged user, so check

[bool] $isadmin=([Security.Principal.WindowsPrincipal] `
  [Security.Principal.WindowsIdentity]::GetCurrent() `
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if ( $isadmin ){
    Write-Error "ERROR: This script should NOT be run as administrator!" -ErrorAction Stop    
}else{

  $linux_distro="Ubuntu-20.04"
  $linux_exe="ubuntu2004.exe"

  wsl --install
  wsl --install -d $linux_distro
  wsl --set-version $linux_distro 2
  wsl --setdefault $linux_distro
  wsl --update
  wsl -d $linux_distro
}
