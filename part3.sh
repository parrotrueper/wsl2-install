#!/bin/bash

# set to 1 to enable debug, 0 to disable
dbgscript=0
if [[ "$dbgscript" -eq 1 ]]; then set -x ; fi

sudo apt install git
sudo apt update

winusr=`wslpath "$(wslvar USERPROFILE)"`
echo "[$winusr]"

# possible locations for Git Credential Manager
gcmpaths=("${winusr}/AppData/Local/Programs/Git/mingw32/bin/git-credential-manager-core.exe")
gcmpaths+=("/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe")
gcmpaths+=("${winusr}/AppData/Local/Programs/Git/mingw64/bin/git-credential-manager.exe")
gcmpaths+=("${winusr}/AppData/Local/Programs/Git/mingw64/libexec/git-core/git-credential-manager.exe")
gcmpaths+=("${winusr}/AppData/Local/Programs/Git/mingw64/bin/git-credential-manager-core.exe")
gcmpaths+=("/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe")
gcmpaths+=("/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe")


found=false
echo "looking for git-credential-manager..."
for i in "${gcmpaths[@]}"; do
    if [[ ! -e "${i}" ]]; then
        echo "${i}"
    else
        gcmexe="\"${i}\""
        found=true
        break
    fi        
done

# If we found it then go ahead and configure git
if [[ "$found" == true ]]; then
    echo "All good, found it ${i}"
    git config --global credential.helper ${gcmexe}
else
    echo "ERROR: Git Credential Manager not found in any of these locations:"
    for i in "${gcmpaths[@]}"; do
        echo "${i}"
    done
    echo "Please install it and rerun this script."
fi    

# disable debug
if [[ "$dbgscript" -eq 1 ]]; then set +x ; fi    
