@ECHO OFF
ECHO.
SET /P ytPath= wklej link z YouTube :
cls
call .tools\ffmpeg\bin\youtube-dl -F %ytPath%
ECHO.
SET /P ytFC= Wybierz FORMAT CODE / jakosc w ktorej chcesz pobrac :
cls
call .tools\ffmpeg\bin\youtube-dl -f %ytFC% %ytPath%
PAUSE