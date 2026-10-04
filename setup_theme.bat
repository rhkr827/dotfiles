@echo off
setlocal
cd /d "%~dp0"
title PowerShell Theme Setup

echo ==========================================================
echo   PowerShell Oh-My-Posh Theme Setup
echo ==========================================================
echo.

where pwsh >nul 2>nul
if %errorlevel% equ 0 (
    pwsh -NoProfile -ExecutionPolicy Bypass -File "%~dp0setup_theme.ps1"
) else (
    powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0setup_theme.ps1"
)

echo.
pause
