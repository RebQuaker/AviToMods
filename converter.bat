@echo off
setlocal enabledelayedexpansion

set "inputDir=input"
set "outputDir=output"

for %%F in ("%inputDir%\*.avi") do (
    set "videoName=%%~nF"
    set "audioFile=%inputDir%\!videoName!.wav"
    set "outputFile=%outputDir%\!videoName!.mods"

    if exist "!audioFile!" (
        AviToMobiclipDs -in "%inputDir%\%%~nxF" -audio "!audioFile!" -out "!outputFile!"
    ) else (
        AviToMobiclipDs -in "%inputDir%\%%~nxF" -out "!outputFile!"
    )
)

endlocal

echo Fim do batch! Cheque sua pasta de outputs!
pause >nul