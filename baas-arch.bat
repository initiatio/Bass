@ECHO OFF

SET /p scriptTitleName=< .cfg\scriptTitleName.txt
SET /p scriptName=< .cfg\scriptName.txt
SET /p scriptVersion=< .cfg\version.txt
SET /p localSeedKey=< .cfg\seedKey.txt


SET scriptSubName=BASS 7Z make Arch



mode con: cols=120 lines=10
color 0f

TITLE %scriptTitleName%-%scriptVersion%
powershell write-host -back DarkRed -fore White `0%scriptName% - BAtch Synchronization Scrypt`0`n`0`0%scriptSubName%`0`0`0`0`0`0`0`0`0`0

ECHO.
ECHO. 
SET /P pullDriv= Wpisz litere Woluminu gdzie chcesz zarchiwizowac strukture BAAS ^>^>

set datetimelog=%date:~-4%-%date:~3,2%-%date:~0,2%-%time:~0,2%%time:~3,2%
set filelogname=%datetimelog%-%localSeedKey%.zip

call MD %pullDriv%:\.BassArch\
call .tools\7z\App\7-Zip\7z a -mx9   %pullDriv%:\.BassArch\%filelogname%
CLS
ECHO.
ECHO.
ECHO Archiwum %pullDriv%:\.BassArch\%filelogname% zostalo utworzone

PAUSE