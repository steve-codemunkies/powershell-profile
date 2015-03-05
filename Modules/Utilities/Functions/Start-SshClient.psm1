Function Start-SshClient {
    $path = "C:\Program Files (x86)\Git\bin\ssh.exe"

    Start-Process -NoNewWindow -Wait $path $args
}