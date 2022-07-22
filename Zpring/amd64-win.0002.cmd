@echo off

:: by Mykhailo Kapitanov <xoomoh@luny.pl>
:: Odessa / Ukraine 2022

for %%i in (libpng libsdl zlib) do (
cd %%i
mingw32-make -f Makefile.amd64-win %1
cd ..
if [%1] == [] echo.
)

mingw32-make -f Makefile.amd64-win %1
