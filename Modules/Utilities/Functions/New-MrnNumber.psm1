Function New-MrnNumber {
    [String[]]$source = "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "1234567890"
    $newNumber = $null
    
    foreach($iteration in 0..1) {
        foreach($counter in 1..5) {
            # Work out which character type to get
            $position = Get-Random $source[$iteration].length
        
            # Add a character from the specified set to the new password
            $newNumber = $newNumber + [char]($source[$iteration].SubString($position, 1))
        }
    }
    
    return $newNumber
}