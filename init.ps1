$gitconfig = "$ENV:USERPROFILE\.gitconfig" 
$vimrc = "$ENV:USERPROFILE\.vimrc.local"
$bashrc = "$ENV:USERPROFILE\.bashrc"
$vimperatorrc = "$ENV:USERPROFILE\_vimperatorrc"
$ahkConfig = "$ENV:USERPROFILE\AutoHotkey.ahk"
$vsvimrc = "$ENV:USERPROFILE\.vsvimrc"
$psprofile = $profile.CurrentUserAllHosts
$psScriptsFolder = "$($profile.CurrentUserAllHosts.Substring(0, $profile.CurrentUserAllHosts.LastIndexOf('\')))\ProfileScripts"
$conemuconfig = '"C:\Program Files\ConEmu\ConEmu.xml"'
$linpadCustomExtensions = "`"$ENV:USERPROFILE\Documents\LINQPad Plugins\Framework 4.6\MyExtensions.FW46.linq`""

if(Test-Path $gitconfig) {    
	rm -Confirm $gitconfig
}
cmd "/c mklink /H $gitconfig .gitconfig"

if(Test-Path $vimrc) {
    rm -Confirm $vimrc
}
cmd "/c mklink /H $vimrc .vimrc.local"


if(Test-Path $ahkConfig) {
    rm -Confirm $ahkConfig	
}
cmd "/c mklink /H $ahkConfig AutoHotkey.ahk"

if(Test-Path $vsvimrc) {
    rm -Confirm $vsvimrc
}
cmd "/c mklink /H $vsvimrc .vsvimrc"

if(Test-Path $psprofile) {
    rm -Confirm $psprofile
}
cmd "/c mklink /H $psprofile profile.ps1"

if(Test-Path $psScriptsFolder) {
    rm -Confirm $psScriptsFolder
}
[Environment]::SetEnvironmentVariable("PSScripts", $psScriptsFolder, "Machine")
cmd "/c mklink /J $psScriptsFolder $psScriptsFolder"

if(Test-Path $bashrc) {
    rm -Confirm $bashrc	
}
cmd "/c mklink /H $bashrc .bashrc"

if(Test-Path $conemuconfig) {
    rm -Confirm $conemuconfig	
}
cmd "/c mklink /H $conemuconfig conemu.xml"

if(Test-Path $linpadCustomExtensions) {
    rm -Confirm $linpadCustomExtensions	
}
cmd "/c mklink /H $linpadCustomExtensions MyExtensions.FW46.linq"

#git clone https://github.com/powerline/fonts.git

#Create git user config
$gitUser = "$ENV:USERPROFILE\.gitconfig.user"
if(!(Test-Path $gitUser)) {
    Add-Content -Path $gitUser -Value "[User]"
    $user = Read-Host -Prompt "Username for git?"
    $userEmail = Read-Host -Prompt "Email for git?"
    Add-Content -Path $gitUser -Value "`tname = $user"
    Add-Content -Path $gitUser -Value "`temail = $userEmail"
}
