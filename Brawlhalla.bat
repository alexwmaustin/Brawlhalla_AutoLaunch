@echo off
rem HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run for the brawlhalla autostart
Setlocal EnableDelayedExpansion

IF EXIST Path.txt (
    goto :loadFile
) ELSE (
    goto :savePath
)

:savePath 
echo path not initalized
set /p drv="What drive letter is brawlhalla in? "

for /R "%drv%:\" %%x in ("*Brawlhalla.exe") do set pth="%%~x"
echo %pth% > Path.txt
goto :exec

:loadFile
for /f "tokens=*" %%G in (Path.txt) do (
  set pth= %%G
)

:exec
Start "" "E:\Steam\steamapps\common\Brawlhalla\Brawlhalla.exe" 
TIMEOUT /T 60
taskkill /F /IM Brawlhalla.exe