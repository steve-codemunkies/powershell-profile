Function Clear-TemporaryInternetFiles {
    [System.Diagnostics.Process]::Start("RunDLL32.exe", "InetCpl.cpl,ClearMyTracksByProcess 8")
}