@ECHO OFF

SET /p scriptTitleName=< .cfg\scriptTitleName.txt
SET /p scriptName=< .cfg\scriptName.txt
SET /p scriptVersion=< .cfg\version.txt
SET /p localSeedKey=< .cfg\seedKey.txt

SET scriptSubName=BASS seedKey Replicator



mode con: cols=120 lines=10
color 0f

TITLE %scriptTitleName%-%scriptVersion%
powershell write-host -back DarkRed -fore White `0%scriptName% - BAtch Synchronization Scrypt`0`n`0`0%scriptSubName%`0`0`0`0`0`0`0`0`0`0`0`0
ECHO.
ECHO.
SET /P pushDrive= Wpisz litere wolumiu gdzie chcesz utworzyc nowy seedKey ^>^>
SET /P newSeedKey= Wpisz nowy 16 znakowy (A-Z)(0-9) seedKey ^>^>


call MD %pushDrive%:\.Bass\.cfg\

DEL %pushDrive%:\.Bass\.cfg\seedKey.txt
ECHO %newSeedKey%>>%pushDrive%:\.Bass\.cfg\seedKey.txt


XCOPY M: N: /E /H /R /V /D /C /Y
CLS
SUBST N: /D
SUBST M: /D
CLS
powershell write-host -back DarkGreen -fore White Wiecej o %scriptTitleName%%scriptVersion% znajdziesz www.initiatio.pl/?q=BASS

timeout /t 0
set "file=.components/files_wav/WTF.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "BASS seedKey #%localSeedKey% zostal zreplikowany na - %pushDrive%:\ " ,666 ,"bass-seedKeyReplicated-finished", 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
if %errorlevel%==1 (
  echo errorLevel 1 
) else (
  echo no errorLevel or diff  
)
del %tmp%\tmp.vbs
del sound.vbs
EXIT /B


