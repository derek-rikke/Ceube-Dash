@echo off
title Ceube Dash - Level Builder

echo.
echo  ==============================
echo    LEVEL BUILDER - Starting up...
echo  ==============================
echo.

:: Check for Node.js
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo  ERROR: Node.js is not installed.
    echo.
    echo  Please install it from: https://nodejs.org
    echo  Choose the "LTS" version, install it, then try again.
    echo.
    pause
    exit /b 1
)

echo  Starting local server...
echo  Opening Level Builder in browser...
echo.
echo  - Build your level in the builder
echo  - Click "Test Play" to try it in the game
echo  - Click "Save" to export the level as a .json file
echo.
echo  When you're done, close this window to stop the server.
echo.

:: Open builder after short delay
start "" /b cmd /c "timeout /t 2 /nobreak >nul && start http://localhost:8000/ceube-dash-builder.html"

:: Start server
npx --yes serve . -p 8000 -s
