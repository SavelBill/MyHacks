import subprocess
import sys
from colorama import Fore, Style

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print()
        print(Fore.MAGENTA + "Uso: spider <opção> [argumentos]" + Style.RESET_ALL)
        print()
        print("Opções disponíveis:")
        print("  -email <site_headers.json> <email_wordlist.txt> <login_function_url>  →  Email Brute Force")
        print("  -user <site_headers.json> <user_wordlist.txt> <login_function_url>  →  User Brute Force")
        sys.exit(1)

    option = sys.argv[1]

    if option in ["-email", "-user"]:
        if len(sys.argv) < 5:
            print()
            print(Fore.YELLOW + f"Uso: spider {option} <arquivo_headers.json> <arquivo_wordlist.txt> <url>" + Style.RESET_ALL)
            sys.exit(1)

        header_file = sys.argv[2]
        wordlist_file = sys.argv[3]
        url = sys.argv[4]
        script_to_run = "email_bruteforce.py" if option == "-email" else "user_bruteforce.py"

        try:
            subprocess.run(["python3", f"project-spider\\python-files\\{script_to_run}", header_file, wordlist_file, url], check=True)
        except subprocess.CalledProcessError:
            print(Fore.RED + "ERROR: Não foi Possível executar o Script" + Style.RESET_ALL)

    else:
        print()
        print(Fore.RED + f"ERROR: Opção '{option}' não Reconhecida." + Style.RESET_ALL)
        print("Use 'spider' para Ver as Opções Disponíveis.")
        sys.exit(1)
