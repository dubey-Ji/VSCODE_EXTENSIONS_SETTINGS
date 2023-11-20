@echo off

REM Arguments %1 and %2 correspond to extensionsFile and settingsFile respectively
echo Extensions file path: %1
echo Settings file path: %2

REM Install extensions from extensions file
for /f %%x in (%1) do (
    code --list-extensions | findstr /i "%%x" >nul
    if errorlevel 1 (
        echo Installing extension: %%x
        code --install-extension %%x
    ) else (
        echo Extension %%x is already installed, skipping.
    )
)

REM Apply settings from settings file
code --settings-file "%2"

echo Setup complete.
