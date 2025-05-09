import subprocess
import platform
from colorama import Fore, Style

def execute(command):
    user_system = platform.system()

    try:
        if user_system == "Linux":
            subprocess.Popen(['gnome-terminal', '--', 'bash', '-c', command + "; exec bash"])
        elif user_system == "Darwin":
            subprocess.Popen(['open', '-a', 'Terminal.app', command])
        elif user_system == "Windows":
            subprocess.Popen(['start', 'cmd.exe', '/k', command], shell=True)
        else:
            print(Fore.RED + "Sistema operacional não suportado para execução em novo terminal." + Style.RESET_ALL)
    except Exception as e:
        print(Fore.RED + f"Erro ao abrir o terminal: {e}" + Style.RESET_ALL)
