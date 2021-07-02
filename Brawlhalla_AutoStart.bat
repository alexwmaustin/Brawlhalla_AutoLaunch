@echo off
rem HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run for the brawlhalla autostart
Setlocal EnableDelayedExpansion


:loadPath
for /f "tokens=3" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\BrawlhallaAutoStart" /V BrawlhallaInstallPath') do set pth=%%a

:exec
Start "" "%pth%" 
TIMEOUT /T 60
taskkill /F /IM Brawlhalla.exe