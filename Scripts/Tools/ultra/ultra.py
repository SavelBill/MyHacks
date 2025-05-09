import os
import sys
import time
import subprocess
import time
import zipfile
from colorama import init, Fore, Style, Back # type: ignore
import requests # type: ignore
import shutil

init(autoreset=True)
from watchdog.observers import Observer # type: ignore
from watchdog.events import FileSystemEventHandler # type: ignore

# Lista de programas disponíveis
programs = {
    "vscode": {
        "name": "Visual Studio Code",
        "url": "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user",
        "install_dir": os.path.join(os.getenv('LOCALAPPDATA'), "Programs", "Microsoft VS Code")
    },
    "google": {
        "name": "Google Chrome",
        "url": "https://dl.google.com/chrome/install/latest/chrome_installer.exe",
        "install_dir": "C:\Program Files\Google"
    },
    "notepadpp": {
        "name": "Notepad++",
        "url": "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.7.6/npp.8.7.6.Installer.x64.exe",
        "install_dir": r"C:\Program Files\Notepad++"
    },
    "nmap": {
        "name": "Nmap Scanner",
        "url": "https://nmap.org/dist/nmap-7.40-setup.exe",
        "install_dir": r"C:\Program Files (x86)\Nmap"
    },
    "firefox": {
        "name": "Mozilla Firefox",
        "url": "https://ftp.mozilla.org/pub/firefox/releases/99.0/win64/pt-BR/Firefox%20Setup%2099.0.exe",
        "install_dir": r"C:\Program Files\Mozilla Firefox"
    },
    "git-ver2": {
        "name": "Git for Windows",
        "url": "https://github.com/git-for-windows/git/releases/download/v2.47.1.windows.2/Git-2.47.1.2-64-bit.exe",
        "install_dir": "C:\Program Files\Git"
    },
    "java-ver8": {
        "name": "Java Oracle",
        "url": "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=251656_7ed26d28139143f38c58992680c214a5",
        "install_dir": "C:\Program Files\Java Oracle"
    },
    "vlc-player": {
        "name": "VLC Media Player",
        "url": "https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe",
        "install_dir": r"C:\Program Files\VideoLAN\VLC"
    },
    "winrar": {
        "name": "WinRAR",
        "url": "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-701.exe",
        "install_dir": "C:\Program Files\WinRAR"
    },
    "burp-suite": {
        "name": "Burp Suite",
        "url": "https://portswigger.net/burp/releases/download?product=community&version=2024.8.5&type=WindowsX64",
        "install_dir": r"C:\Program Files\BurpSuiteCommunityEdition"
    },
    "wireshark": {
        "name": "Wireshark",
        "url": "https://2.na.dl.wireshark.org/win64/all-versions/Wireshark-4.1.0-x64.exe",
        "install_dir": "C:\Program Files\Wireshark"
    },
    "metasploit": {
        "name": "Metasploit Framework",
        "url": "https://github.com/rapid7/metasploit-framework/releases/download/6.2.15/metasploit-latest-windows-x64.exe",
        "install_dir": "C:\Program Files\Metasploit"
    }
}

class InstallMonitor(FileSystemEventHandler):
    """ Monitora mudanças no diretório de instalação e exibe novos arquivos. """
    def on_created(self, event):
        if not event.is_directory:
            print(Fore.LIGHTMAGENTA_EX + f" {event.src_path}" + Style.RESET_ALL)

def monitor_installation(directory):
    """ Inicia o monitoramento do diretório de instalação. """
    observer = Observer()
    event_handler = InstallMonitor()
    observer.schedule(event_handler, directory, recursive=True)
    observer.start()
    return observer

def move_zip_to_desktop(zip_path):
    """ Move o arquivo zip para a área de trabalho do usuário. """
    desktop_dir = os.path.join(os.path.expanduser("~"), "Desktop")
    zip_dest = os.path.join(desktop_dir, os.path.basename(zip_path))
    shutil.move(zip_path, zip_dest)
    print(Fore.GREEN + f"\nArquivo ZIP movido para {zip_dest}" + Style.RESET_ALL)

def install_program(program_key):
    """ Baixa e instala o programa especificado. """
    if program_key not in programs:
        print()
        print(Fore.LIGHTRED_EX + Back.RED + f"ERROR: Pacote '{program_key}' não Encontrado!" + Style.RESET_ALL)
        return

    program = programs[program_key]
    installer_path = os.path.join(os.getenv("TEMP"), f"{program_key}-installer.exe")

    print(Fore.LIGHTBLUE_EX + Back.BLUE + f"\nBaixando {program['name']}..." + Style.RESET_ALL)
    print(Fore.YELLOW + f" {installer_path}" + Style.RESET_ALL)  # Exibe o caminho do arquivo de download
    subprocess.run(["curl", "-L", "-o", installer_path, program["url"]], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    
    if not os.path.exists(installer_path):
        print(Fore.LIGHTRED_EX + Back.RED + "ERROR: Caminho do Instalador não Encontrado" + Style.RESET_ALL)
        return

    # Verifica a extensão do arquivo
    if installer_path.endswith(".zip"):
        print(Fore.BLUE + f"Arquivo ZIP detectado, movendo para a área de trabalho..." + Style.RESET_ALL)
        move_zip_to_desktop(installer_path)
    else:
        print(Fore.LIGHTBLUE_EX + Back.BLUE + f"\nInstalando {program['name']}..." + Style.RESET_ALL)
        print()

        install_dir = program["install_dir"]
        if not os.path.exists(install_dir):
            os.makedirs(install_dir, exist_ok=True)

        observer = monitor_installation(install_dir)
        #Install Process Modifiers ---------------------------------------------
        if program_key == "java-ver8":
            install_process = subprocess.Popen([installer_path, "/s", 'INSTALLDIR=C:\Program Files\Java Oracle'])
        elif program_key == "burp-suite":
            print(Fore.YELLOW + "O Burp Suite requer Interação do Usuário" + Style.RESET_ALL)
            print(Fore.YELLOW + "Possível ERRO de " + Fore.RED + "Acesso Negado" + Style.RESET_ALL)
            install_process = subprocess.Popen([installer_path, "/silent", "/verysilent", "/norestart", "/S"])
        else:
            install_process = subprocess.Popen([installer_path, "/silent", "/verysilent", "/norestart", "/S"])

        install_process.wait()
        
        sys.stdout.flush()
        sys.stderr.flush()

        print(Fore.LIGHTGREEN_EX + Back.GREEN + f"\n{program['name']} Instalado com Sucesso!" + Style.RESET_ALL)
    os.remove(installer_path)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print()
        print(Fore.YELLOW + Back.LIGHTMAGENTA_EX + "Uso: ultra <PACKAGE1> <PACKAGE2>" + Style.RESET_ALL)
        print(Fore.CYAN + Back.BLUE + "Credits: Richard Lage aka NotWeird" + Style.RESET_ALL)
        print()
        print("\nLista de pacotes disponíveis:")
        print()
        for key, info in programs.items():
            print(Fore.GREEN + f"  {key:<10}        - {info['name']}" + Style.RESET_ALL)
        sys.exit(1)

    for arg in sys.argv[1:]:
        install_program(arg.lower())