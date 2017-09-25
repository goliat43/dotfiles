#Current user all hosts

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

set-alias np "C:\Program Files (x86)\Notepad++\notepad++.exe"
Import-Module z