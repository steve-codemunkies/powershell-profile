function FuncCheckService{
	param($ServiceName)
	
	$arrService = Get-Service -Name $ServiceName
	
	if ($arrService.Status -ne "Running"){
		Start-Service $ServiceName
		Write-Host "Starting " $ServiceName " service" 
	}
	if ($arrService.Status -eq "running"){ 
		Write-Host "$ServiceName service is already started"
	}
}

function Start-HLMongoDB{
	FuncCheckService "HavasLynxMongoDB"
}