@echo off
set desktop=C:\Users\%username%\desktop
set userfolder=C:\Users\%username%
set frogtxt=C:\Users\%username%\frog.txt
cd files
if not exist %frogtxt% goto login
mode 100, 40
goto banner

:login
cls
mode 85, 30
title Login do Frog
color 1f

echo --- Login ---
echo.
echo Por favor Nao use Espacos
set /p user="Insira seu Nome de Usuario do Frog= "
echo Bem-vindo(a) %user%
echo.
timeout /t 2 /nobreak > nul

:pass
cls
echo --- Login ---
echo Por favor Nao use Espacos
set /p pass="Insira sua Senha do Frog= "
cls

echo --- Login ---
echo Insira sua Senha do Frog= SENHA SUPER SECRETA
set /p pass_confirm="Confirme sua Senha= "
if not %pass_confirm% == %pass% goto pass_cfm_error
echo A Senha esta Certa!
timeout /t 2 /nobreak > nul

cls
echo Salvando as Configuracoes...
timeout /t 3 /nobreak > nul

setx froguser %user% >nul
if %errorlevel% EQU 0 echo Nome de Usuario Salvo

setx frogpass %pass% >nul
if %errorlevel% EQU 0 echo Senha salva

echo Salvado com Sucesso!!!

echo> %frogtxt% Username: %user% - %random% %random%
timeout /t 2 /nobreak > nul
exit

:pass_cfm_error
powershell -Command "Write-Host 'Voce errou a Senha!' -ForegroundColor Red"
timeout /t 2 /nobreak > nul
goto pass

:banner
cls & color 0f & chcp 65001 >nul & title Frog - By NotWeird
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
echo (2) DNS Brute Force
echo (3) Portscan
echo (4) Ping
echo (5) Remote Desktop
echo (6) Frog - Users Menu
echo (7) WHOIS
echo (8) Ip Geolocation
echo (9) Windows Sandbox
echo (10) Resource Hacker
echo.
echo (11) Pagina 2
:input
echo.
set /p input="Escolha o Processo= "

if %input% == 0 goto banner
if %input% == 1 start taskmgr.exe & goto input
if %input% == 2 python dnsbrute.py & goto input
if %input% == 3 python portscan.py & goto input
if %input% == 7 python domain_lookup.py & goto input
if %input% == 8 python ip_geolocation.py & goto input
if %input% == 10 cd resource_hacker & start ResourceHacker.exe & cd.. & goto input
if %input% == secret goto secret
if %input% == 11 cd.. & page2.cmd
if %input% == credits goto credits

if %input% EQU 4 (
    goto input4
)
goto check_5

:input4
echo.
set /p site="Escolha o Site= "
echo.
powershell -Command "Write-Host 'Pinging...' -ForegroundColor DarkGreen"
ping %site%
echo.
powershell -Command "Write-Host 'Getting Addresses...' -ForegroundColor DarkGreen"
echo.
nslookup %site%
echo Processo Finalizado!
goto input

:check_5
if %input% EQU 5 (
    echo.
    set /p host="Host / Nome do PC= "
    set /p user="Nome de Usuario do Alvo= "
    set /p pass="Senha do Alvo= "
    cmdkey /add:%host% /user:%user% /pass:%pass% >nul
    mstsc /v:%host%
    cmdkey /delete:%host% >nul
    goto input
)

if %input% EQU 6 (
    copy users-menu.bat %desktop% >nul
    echo.
    if %errorlevel% EQU 0 echo Frog - Users Menu Criado com Sucesso na Area de Trabalho!
    if %errorlevel% EQU 0 echo Criado na Area de Trabalho para usar com Remote Desktop
    goto input
)

if %input% EQU 9 (

    if not exist "%windir%\System32\WindowsSandbox.exe" (
        powershell -Command "Write-Host 'Error: O Windows nao tem o Windows Sandbox' -ForegroundColor Red"
        powershell -Command "Write-Host 'Requirementos: Windows 10 Pro, Recurso Windows Sandboxe e Maquina Virtual Ativados' -ForegroundColor Red"
        pause
        goto input
    )
    start %windir%\System32\WindowsSandbox.exe
    goto input
)

goto input

:credits
echo CHATGPT AND NOTWEIRD/RICHARD
goto input

:secret
color 04
cls
set /p verify="Qual a Senha secreta???= "
if %verify% == mearybonito goto yes2
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
exit
:yes2
color 0a
powershell -Command "Write-Host 'Senha Correta' -ForegroundColor DarkGreen"
echo Bem-vindo NotWeird
pause >nul
cls
title SUPER FROGGGGGGG
cmd

:end