# wsl --unregister Arch

Get-Content .env | ForEach-Object {
	$key, $value = $_ -split '=', 2
	[System.Environment]::SetEnvironmentVariable($key.Trim(), $value.Trim(), "Process")
}

wsl --set-default Arch
wsl bash ./root.sh
wsl --shutdown
wsl bash ./user.sh $env:GIT_USERNAME $env:GIT_EMAIL
