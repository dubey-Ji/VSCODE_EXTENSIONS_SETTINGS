@echo off

REM Arguments %1 and %2 correspond to extensionsFile and settingsFile respectively
echo Extensions file path: %1
echo Settings file path: %2

REM Read extensions from extensions.json using PowerShell
for /f %%x in ('powershell -Command "(Get-Content %1 | ConvertFrom-Json).recommendations"') do (
    code --list-extensions | findstr /i "%%x" >nul
    if errorlevel 1 (
        echo Installing extension: %%x
        code --install-extension %%x
    ) else (
        echo Extension %%x is already installed, skipping.
    )
)

REM Apply settings from settings file
REM Replace 'DESTINATION_PATH' with the appropriate path where you want to copy the settings file
copy /Y "%~f2" "%USERPROFILE%\AppData\Roaming\Code\User\settings.json"

echo Setup complete.
