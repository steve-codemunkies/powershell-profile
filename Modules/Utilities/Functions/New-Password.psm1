Function New-Password {
    param([int]$length = 12,
        [int]$complexity = 4)
    
    [String[]]$source = "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "1234567890", "[]{}<>@#~?!£$%^&*()"
    $newPassword = $null
    
    foreach($counter in 1..$length) {
        # Work out which character type to get
        $set = Get-Random $complexity
        $position = Get-Random $source[$set].length
        
        # Add a character from the specified set to the new password
        $newPassword = $newPassword + [char]($source[$set].SubString($position, 1))
    }
    
    return $newPassword
}