# Verifica se está sendo executado como Administrador
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Por favor, execute o script como Administrador." -ForegroundColor Red
    exit
}

Write-Host "Instalando o Subsistema Windows para Linux (WSL)..." -ForegroundColor Cyan

# Habilita o recurso WSL
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Habilita a Plataforma de Máquina Virtual
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Reinicia o Windows para aplicar as alterações
Write-Host "Reiniciando o sistema em 5 segundos para concluir a instalação..." -ForegroundColor Yellow
Start-Sleep -Seconds 5
shutdown.exe /r /t 0
