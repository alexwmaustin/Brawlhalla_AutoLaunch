@echo off

:loadPath
for /f "tokens=3*" %%a in ('REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Valve\Steam" /V SteamExe') do ( set pth=%%a %%b )
set pth=%pth:/=\%

:exec
Start "" "%pth%" "steam://rungameid/291550"
TIMEOUT /T 75
taskkill /F /IM BrawlhallaGame.exe