@echo off

:: by Mykhailo Kapitanov <xoomoh@luny.pl>
:: Odessa / Ukraine 2022

C:\Software\FFmpeg\FFmpeg -framerate 5 -i "%%04d.png" -c:v mjpeg -vf fps=30 -f matroska Out.mkv
C:\Software\FFmpeg\FFmpeg -i Out.mkv -i Music.mp3 -shortest -c:v copy -c:a copy -f matroska Video.mkv
C:\Software\FFmpeg\FFmpeg -i Video.mkv -acodec libmp3lame -q:a 0 -ac 2 -ar 48000 -vcodec libx264 -tune film -vf format=yuv420p -f mp4 Out.mp4
