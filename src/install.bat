@echo off

:savePath 
set /p drv="What drive letter is steam in? "
for /d %%x in ("%drv%:\*") do (IF "%%x" == "e:\Steam" set pth=%%~x)
set pth= "%pth%\steamapps\common\Brawlhalla\Brawlhalla.exe"

:setRegKey
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\BrawlhallaAutoStart" /V BrawlhallaInstallPath /T REG_SZ /D %pth% /F

:moveScript
COPY /Y Brawlhalla_AutoStart.bat "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"


@REM set %pth%= %SystemDrive%\ProgramData\BrawlhallaAutoStart\Brawlhalla_AutoStart.bat
@REM :changeRunKey
@REM REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V BrawlhallaAutoStart /T REG_SZ /D %pth% /F