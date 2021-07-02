@REM @echo off

@REM Goals
@REM  1. Find the brawlhalla path
@REM  2. Set a Reg key with the path info
@REM  3. Move the script to somewhere on the C drive
@REM  4. Change the Run regkey

:savePath 
set /p drv="What drive letter is steam in? "
for /d %%x in ("%drv%:\*") do (IF "%%x" == "e:\Steam" set pth=%%~x)
set pth= "%pth%\steamapps\common\Brawlhalla\Brawlhalla.exe"

:setRegKey
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE" /V BrawlhallaInstallPath /T REG_SZ /D %pth% /F

:moveScript
MOVE /Y Brawlhalla_AutoStart.bat %SystemDrive%\ProgramData\BrawlhallaAutoStart
set %pth%= %SystemDrive%\ProgramData\BrawlhallaAutoStart\Brawlhalla_AutoStart.bat

:changeRunKey
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V BrawlhallaAutoStart /T REG_SZ /D %pth% /F