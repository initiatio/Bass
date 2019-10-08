@ECHO OFF

SET /p scriptTitleName=< .cfg\scriptTitleName.txt
SET /p scriptName=< .cfg\scriptName.txt
SET /p scriptVersion=< .cfg\version.txt
SET /p localSeedKey=< .cfg\seedKey.txt


SET scriptSubName=Pull BASS Tree From Drive   



mode con: cols=120 lines=10
color 0f

TITLE %scriptTitleName%-%scriptVersion%
powershell write-host -back DarkRed -fore White `0%scriptName% - BAtch Synchronization Scrypt`0`n`0`0%scriptSubName%`0`0`0`0`0`0`0`0`0`0
ECHO.
ECHO.
SET /P pullDrive= Wpisz litere wolumiu z ktorego chcesz pobrac strukture BASS ^>^>
SUBST N: %pullDrive%:\.Bass
SUBST M: C:\.Bass
ECHO.
ECHO.

SET /p driveSeedKey=< %pullDrive%:\.Bass\.cfg\seedKey.txt

if %localSeedKey%==%driveSeedKey% GOTO loop-pull
GOTO loop-end
:loop-pull

XCOPY N: M: /E /H /R /V /D /C /Y
CLS
SUBST N: /D
SUBST M: /D
CLS
powershell write-host -back DarkGreen -fore White Wiecej o %scriptTitleName%%scriptVersion% znajdziesz www.initiatio.pl/?q=BASS

timeout /t 0
set "file=.components/files_wav/LSTO.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "Struktura BASS %scriptVersion% zaktualizowana`nz woluminem - %pullDrive%:\ " ,666 ,"bass-PULL-finished", 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
if %errorlevel%==1 (
  echo errorLevel 1 
) else (
  echo no errorLevel or diff  
)
del %tmp%\tmp.vbs
del sound.vbs
EXIT /B
:loop-end
CLS
SUBST N: /D
SUBST M: /D
CLS
powershell write-host -back DarkGreen -fore White %scriptTitleName%%scriptVersion% seedKey ERROR 

timeout /t 0
set "file=.components/files_wav/WCS.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "Niezgodny localSeedKey #%localSeedKey% z driveSeedKey #%driveSeedKey% ta struktura BASS moze nalezy do innego uzytkownika  " ,666 ,"bass-PULL-failed", 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
if %errorlevel%==1 (
  echo errorLevel 1 
) else (
  echo no errorLevel or diff  
)
del %tmp%\tmp.vbs
del sound.vbs
EXIT /B



