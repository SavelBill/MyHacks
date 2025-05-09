@echo off
cd files
set desktop=C:\Users\%username%\desktop
set userfolder=C:\Users\%username%
set frogtxt=C:\Users\%username%\frog.txt
color 0f & cls
set /p verify="Qual a Senha do Frog? "

if %verify% == %frogpass% (
    powershell -Command "Write-Host 'Senha Correta!' -ForegroundColor Green"
    timeout /t 2 /nobreak > nul
    cls & goto banner
) else (
    powershell -Command "Write-Host 'Senha Incorreta :(' -ForegroundColor Red"
    timeout /t 2 /nobreak > nul
    exit
)

:banner
cls & color 0f & chcp 65001 >nul & title Frog - By NotWeird PAGE 2
echo.
echo.
echo            		       ███████╗██████╗  ██████╗  ██████╗
echo            		       ██╔════╝██╔══██╗██╔═══██╗██╔════╝
echo            		       █████╗  ██████╔╝██║   ██║██║  ███╗
echo            		       ██╔══╝  ██╔══██╗██║   ██║██║   ██║
echo            		       ██║     ██║  ██║╚██████╔╝╚██████╔╝
echo            		       ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚═════╝
powershell -Command "Write-Host '[%froguser% $ %computername%]' -ForegroundColor Cyan"
powershell -Command "Write-Host 'Feito por Richard / NotWeird' -ForegroundColor DarkGreen"
echo.
echo.
echo (0) Clear
echo (1) Task Manager
echo (2) 
echo (3) 
echo (4) 
echo (5) 
echo (6) 
echo (7) 
echo (8) 
echo (9) 
echo (10) 
echo.
echo (11) Pagina 3
:input
echo.
set /p input="Escolha o Processo= "

if %input% == 0 goto banner
if %input% == 1 start taskmgr.exe & goto input

goto input