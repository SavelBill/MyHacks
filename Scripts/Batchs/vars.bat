@echo off
cls & color 0f & mode 82, 30 & title Vars
echo ---------------------------------------------------------------------------------
echo.
echo.
echo Tudo comeca com Porcentagem!
echo.
echo O "__cd__" Termina com Porcentagem
echo.
echo 1-~nx1 = Nome do Arquivo que e Jogado em Cima
echo 2-~nx0 = Nome do Script bat, E util se a Pessoa renomear ele
echo 3-~1 = Diretorio do Arquivo que e jogado com extensao
echo 4-~dp1 = Pasta que o Arquivo esta
echo 5-__cd__ = Pasta que o Script Batch esta(com o comando cd) ou o Arquivo
echo 6-~f0 = Local do Script Batch
echo 7-~dp0 = Mostra so a Pasta do Script Batch
echo.
echo 0 = Do Script Batch, 1 = Arquivo Jogado em Cima!
echo.
echo Em Pratica:
echo.
if "%~1" equ "" (
    echo Nenhum Arquivo Jogado em Cima do Script Batch
) else (
    echo 1-%~nx1
    echo 3-%~1
    echo 4-%~dp1
)
echo 2-%~nx0
echo 5-%__cd__%
echo 6-%~f0
echo 7-%~dp0
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ---------------------------------------------------------------------------------
:pause
pause >nul
goto pause