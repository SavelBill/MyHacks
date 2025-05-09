@echo off
if exist C:\Windows\System32\rabbit.cmd goto process
if not exist C:\Users\%username%\Desktop\rabbit.cmd goto warning_desktop
if not exist C:\Windows\System32\rabbit.cmd goto install

:errorlvl
cls
title Desktop Error
powershell -Command "Write-Host 'Error: O Arquivo rabbit.cmd precisa estar na Area de Trabalho!' -ForegroundColor Red"
pause >nul
exit

:install
setx new yes >nul
cls
title Instalacao do Rabbit
echo Instalando...
timeout /t 4 /nobreak >nul
copy C:\Users\%username%\Desktop\rabbit.cmd C:\Windows\System32 >nul
del C:\Users\%username%\Desktop\rabbit.cmd >nul
if not %errorlevel% EQU 0 goto errorlvl
cls
echo instalado com Sucesso! :D
echo OBS: Esta tudo sem Acentos e cecedilhas! Obrigado pela sua Compreensao
echo Se Quiser Desinstalar use "rabbit -unin"
pause >nul
exit

:settings
cls
echo Bem-vindo(a) as Configuracoes do RABBIT
echo.
set /p themec="Qual tema Voce quer? PRETO (P/B) BRANCO= "
cls
echo Nao use Espacos no Nome ou voce ficara sem
echo Invez de Espaco use _
set /p rabbitnamec="Como quer ser Chamado pelo Rabbit?= "
setx new no >nul
setx theme %themec% >nul
setx rabbitname %rabbitnamec% >nul
cls
echo Configuracoes concluidas com Sucesso!
timeout /t 2 /nobreak >nul
exit

:warning_desktop
title Desktop Error
powershell -Command "Write-Host 'Error: O Arquivo rabbit.cmd precisa estar na Area de Trabalho!' -ForegroundColor Red"
pause >nul
exit

:process
if "%1" == "-unin" goto uninstall
if %new% == yes goto settings
cls
if %theme% == P color 0a
if %theme% == p color 0a
if %theme% == Preto color 0a
if %theme% == preto color 0a
if %theme% == B color fa
if %theme% == b color fa
if %theme% == Branco color fa
if %theme% == branco color fa
title Rabbit Process
mode 100
chcp 65001 >nul
echo                 ██████╗  █████╗ ██████╗ ██████╗ ██╗████████╗
echo                 ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║╚══██╔══╝
echo                 ██████╔╝███████║██████╔╝██████╔╝██║   ██║   
echo                 ██╔══██╗██╔══██║██╔══██╗██╔══██╗██║   ██║   
echo                 ██║  ██║██║  ██║██████╔╝██████╔╝██║   ██║   
echo                 ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═════╝ ╚═╝   ╚═╝                                        
powershell -Command "Write-Host '[%rabbitname%$%computername%]' -ForegroundColor Magenta"
echo [Criado e Programado e Digitado e Tudo por Richard]
echo.
set /p s="Escolha o Site= "
set /p a="Salvar em um Arquivo? (S/N) "
if %a% == s goto intxt
if %a% == S goto intxt
if %a% == sim goto intxt
if %a% == Sim goto intxt
if %a% == yes goto intxt
if %a% == Yes goto intxt
if %a% == ss goto intxt
if %a% == SS goto intxt
if %a% == simm goto intxt
if %a% == Simm goto intxt
if %a% == yess goto intxt
if %a% == Yess goto intxt
echo.
ping -l size %s%
nslookup %s%
tracert -d %s%
powershell -Command "Write-Host 'Processo Finalizado!' -ForegroundColor Magenta"
goto end

:intxt
cd C:\Users\%username%\Desktop
ping -l size %s% >output1.txt
nslookup %s% >output2.txt
tracert -d %s% >output3.txt
powershell -Command "Write-Host 'Processo Finalizado!' -ForegroundColor Magenta"
goto end

:uninstall
reg delete HKCU\Environment /v new /f
reg delete HKCU\Environment /v rabbitname /f
reg delete HKCU\Environment /v theme /f
del C:\Windows\System32\rabbit.cmd
powershell -Command "Write-Host 'Desintalado com Tristeza :(' -ForegroundColor Red"
pause >nul
exit

:end
pause >nul
cls
goto process