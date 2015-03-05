Function Start-HlConsumer {
    param([string]$platform = "ot-uk")

    $path = $null

    if($platform.ToLower() -eq "hh-us") {
        $path = "D:\git\cprm\src\core\Havas.CareForToday.Consumers.Host.HeartHealth.US\bin\Debug\Havas.CareForToday.Consumers.Host.HeartHealth.US.exe"
    } elseif($platform.ToLower() -eq "hh-uk") {
        $path = "D:\git\cprm\src\core\Havas.CareForToday.Consumers.Host.HeartHealth.UK\bin\Debug\Havas.CareForToday.Consumers.Host.HeartHealth.UK.exe"
    } elseif($platform.ToLower() -eq "ot-uk") {
        $path = "D:\git\cprm\src\core\Havas.CareForToday.Consumers.Host.OrthopaedicTherapy.UK\bin\Debug\Havas.CareForToday.Consumers.Host.OrthopaedicTherapy.UK.exe"
    }

    if($path -eq $null) {
        return
    }

    Start-Process $path
}
