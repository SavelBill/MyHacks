Write-Host "🛠️ Instalando o Kali Linux..." -ForegroundColor Cyan

# Instala o Kali Linux
wsl --install -d Kali-Linux

# Define o Kali como distribuição padrão
wsl --set-default Kali-Linux

# Inicia o Kali automaticamente
Write-Host "🚀 Iniciando o Kali Linux..." -ForegroundColor Green
wsl -d Kali-Linux