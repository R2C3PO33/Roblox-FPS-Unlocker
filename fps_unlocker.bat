@echo off
setlocal enabledelayedexpansion

:: Set path to Roblox ClientSettings
set "clientSettings=%LOCALAPPDATA%\Roblox\ClientSettings"

:: Create the folder if it doesn't exist
if not exist "%clientSettings%" (
    mkdir "%clientSettings%"
)

:: === Main watcher loop ===
:watchLoop
tasklist /fi "imagename eq RobloxPlayerBeta.exe" | find /i "RobloxPlayerBeta.exe" >nul
if %errorlevel%==0 (
    (
        echo {
        echo     "DFIntTaskSchedulerTargetFps": 29383,
        echo     "FFlagGameBasicSettingsFramerateCap5": false,
        echo     "FFlagTaskSchedulerLimitTargetFpsTo2402": "False"
        echo }
    ) > "%clientSettings%\IxpSettings.json"
)

:: Wait only 1 second for faster detection
timeout /t 1 /nobreak >nul
goto watchLoop
