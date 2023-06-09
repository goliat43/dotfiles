#Current user all hosts
remove-item alias:curl
Remove-Item alias:wget

function which {	
	$a = $args
	$res = Get-Command $a
	if($res.CommandType -like "Alias") {
		Write-Host "Alias: $($res.Name)"
	}
	else {
		Write-Host "$($res.Name)`t$($res.Source)"
	}
	
}

#function touch {
#
#	echo $null >> $args
#}
 	
function whoami { (get-content env:\userdomain) + "\" + (get-content env:\username) }

set-alias np "C:\Program Files\Notepad++\notepad++.exe"
set-alias sudo elevate-process
set-alias g git
set-alias ssh 'C:\Program Files\Git\usr\bin\ssh.exe'



Import-Module pscx
Import-Module z
#Import-VisualStudioVars 2017
oh-my-posh --init --shell pwsh --config C:\src\dotfiles\oh-my-posh.json | Invoke-Expression
Import-Module -Name Terminal-Icons

Get-ChildItem $env:PSScripts -filter "*.ps1" | ForEach-Object {. (Join-Path $env:PSScripts $_.Name)} | Out-Null