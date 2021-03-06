#Downloads the current sysinternals from \\live.sysinternals.com\tools
#If you call get-sysinternals without any args the local directory 
#will be systemroot\Sysinternals\
#Otherwise, the files will be put in the specified path.

#Ex:get-sysinternals C:\tools\Sysinternals will download files to that directory.

function Get-SysInternals {
    
    param ( $sysIntDir=(Join-Path $env:systemroot "\Sysinternals\") )
    
    if(![System.String]::IsNullOrEmpty($env:SysInternalsDirectory)) { $sysIntDir=$env:SysInternalsDirectory }
    
    if(!(Test-Path -Path $sysIntDir -PathType Container)) {
        $null = New-Item -Type Directory -Path $sysIntDir -Force
    }
    
    $log = Join-Path $sysIntDir "changes.log"
    Add-Content -force $log -value "`n`n[$(get-date)]SysInternals sync has been started"
    
    net use \\live.sysinternals.com\tools /persistent:no
    New-PSDrive -Name SYS -PSProvider filesystem -Root \\live.sysinternals.com\tools
    
    Get-ChildItem Sys: -recurse | ForEach-Object {
    
        $fileName = $_.name
        $localFile = Join-Path $sysIntDir $_.name
        $exist = Test-Path $localFile
        
        $msgNew = "new utility found: $fileName , downloading..."
        $msgUpdate = "file : $fileName  is newer, updating..."
        $msgNoChange = "nothing changed for: $fileName"
        
        if($exist) {
            if($_.lastWriteTime -gt (Get-Item $localFile).lastWriteTime) {
                Copy-Item $_.fullname $sysIntDir -force
                Write-Host $msgUpdate -fore yellow
                Add-Content -force $log -value $msgUpdate
            } else {
                Add-Content $log -force -value $msgNoChange
                Write-Host $msgNoChange
            }
        } else {
            if($_.extension -eq ".exe") {
                Write-Host $msgNew -fore green
                Add-Content -force $log -value $msgNew
            }
            
            Copy-Item $_.fullname $sysIntDir -force
        }
    }
 
    net use \\live.sysinternals.com\tools\ /delete
}
