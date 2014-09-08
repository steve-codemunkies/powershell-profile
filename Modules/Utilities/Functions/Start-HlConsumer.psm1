Function Start-HlConsumer {
    param([string]$country = "us")

    $path = $null

    if($country.ToLower() -eq "us") {
        $path = "Z:\git\cprm\src\core\Havas.CareForToday.Consumers.Host.HeartHealth.US\bin\Debug\Havas.CareForToday.Consumers.Host.HeartHealth.US.exe"
    } elseif($country.ToLower() -eq "uk") {
        $path = "Z:\git\cprm\src\core\Havas.CareForToday.Consumers.Host.HeartHealth.UK\bin\Debug\Havas.CareForToday.Consumers.Host.HeartHealth.UK.exe"
    }

    if($path -eq $null) {
        return
    }

    Start-Process $path
}