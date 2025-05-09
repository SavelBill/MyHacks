@ECHO off
TITLE CmdInstaller
Net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo.
    powershell -Command "Write-Host 'Error: %~nx0 nao e Administrador' -ForegroundColor Red"
    exit /b 1
)
if "%~1" equ "" (
    echo.
    powershell -Command "Write-Host 'Warning: Jogue seu Arquivo em cima do %~nx0' -ForegroundColor Yellow"
    exit /b 0
)
move %~1 %windir%\System32 >nul 2>&1
if exist "%windir%\System32\%~nx1" (
    echo.
    echo Arquivo instalado com Sucesso
    exit /b 0
) else (
    echo.
    Powershell -Command "Write-Host 'Error: Nao foi possivel mover o Arquivo' -ForegroundColor Red"
    exit /b 1
)