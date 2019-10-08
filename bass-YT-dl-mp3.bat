SET /P ytPath= wklej link z YouTube

call C:\___collections\ffmpeg\bin\youtube-dl --extract-audio --newline  --audio-format mp3 %ytPath%