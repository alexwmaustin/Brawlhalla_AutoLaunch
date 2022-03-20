@echo off
Setlocal EnableDelayedExpansion


:loadPath
for /f "tokens=3" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\BrawlhallaAutoStart" /V BrawlhallaInstallPath') do set pth=%%a

:exec
Start "" "%pth%" 
TIMEOUT /T 75
taskkill /F /IM BrawlhallaGame.exe