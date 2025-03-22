# wsl --unregister Arch

$path = "$PSScriptRoot" -replace '\\', '/' -replace '^C:', '/mnt/c'
(Get-Content "$PSScriptRoot\root.sh" -Raw) `
	-replace "`r`n", "`n" `
	-replace "`r", "" |
	Set-Content "$PSScriptRoot\root.sh"
(Get-Content "$PSScriptRoot\user.sh" -Raw) `
	-replace "`r`n", "`n" `
	-replace "`r", "" | 
	Set-Content "$PSScriptRoot\user.sh"

wsl --set-default Arch
wsl bash "$path/root.sh"
wsl --shutdown
wsl bash "$path/user.sh"
