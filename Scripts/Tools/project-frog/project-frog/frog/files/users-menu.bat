@echo off
:menu
chcp 65001 >nul & cls & color 03 & mode 75, 30 & title Frog - Users Menu
echo    -Frog Ultimate Users Tool
echo.
echo    (0) Limpar Tela
echo    (1) Listar Usuarios
echo    (2) Criar um Novo Usuario
echo    (3) Mudar a Senha de um Usuario
:input
echo.
set /p input="╚"

if %input% EQU 0 (
    goto menu
)

if %input% EQU 1 (
    echo.
    echo Usuario Atual: %username%
    net user
    echo Processo Finalizado
    goto input
)

if %input% EQU 2 (
    call :check
    echo.
    set /p usernm="Insira o Nome do Usuario= "
    set /p pass="Insira a Senha para o Usuario= "
    net user %usernm% %pass% /add
    if %errorlevel% EQU 0 echo Usuario %usernm% criado com a Senha %pass%!
    pause >nul
    goto menu
)

if %input% EQU 3 (
    call :check
    echo.
    set /p target="Insira o Nome de Usuario do Alvo= "
    set /p newpass="Insira a Nova Senha do Alvo= "
    net user %target% %newpass%
    pause >nul
    goto menu
)

:check
net session >nul
if %errorlevel% NEQ 0 (
    echo O Frog - Users Menu Nao é Admin
    echo Feche e Abra como Admin!
)