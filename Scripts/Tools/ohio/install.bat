@echo off
rd C:\Windows\System32\ohio.bat >nul
color 03
echo Feito por Richard
echo Made by NotWeird
echo Instalando... / Installing...
timeout /t 5 /nobreak >nul
copy C:\Users\%username%\Desktop\ohio\ohio.bat C:\Windows\System32
del C:\Users\%username%\Desktop\ohio /Q
del C:\Users\%username%\Desktop\ohio /Q