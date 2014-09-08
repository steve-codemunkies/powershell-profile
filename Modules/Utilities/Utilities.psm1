$env:SysInternalsDirectory = "D:\ToKeep\SysInternals"
$script:CodeDirectory = "$psScriptRoot\Functions"

Get-ChildItem -Path $script:CodeDirectory -Filter *.psm1 | `
    ForEach-Object { Import-Module $_.FullName }
