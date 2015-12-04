$gitconfig = "$ENV:USERPROFILE\.gitconfig" 
$vimrc = "$ENV:USERPROFILE\.vimrc.local"
$vimperatorrc = "$ENV:USERPROFILE\_vimperatorrc"
$ahkConfig = "$ENV:USERPROFILE\AutoHotkey.ahk"

if(Test-Path $gitconfig) {
    rm -Confirm $gitconfig
}
if(Test-Path $vimrc) {
    rm -Confirm $vimrc
}
if(Test-Path $vimperatorrc) {
    rm -Confirm $vimperatorrc
}
if(Test-Path $ahkConfig) {
    rm -Confirm $ahkConfig
}

cmd "/c mklink /H $gitconfig .gitconfig"
cmd "/c mklink /H $vimrc .vimrc.local"
cmd "/c mklink /H $vimperatorrc _vimperatorrc"
cmd "/c mklink /H $ahkConfig AutoHotkey.ahk"

#Create git user config
$gitUser = "$ENV:USERPROFILE\.gitconfig.user"
if(!(Test-Path $gitUser)) {
    Add-Content -Path $gitUser -Value "[User]"
    $user = Read-Host -Promp "Username for git?"
    $userEmail = Read-Host -Prompt "Email for git?"
    Add-Content -Path $gitUser -Value "`tname = $user"
    Add-Content -Path $gitUser -Value "`temail = $userEmail"
}
