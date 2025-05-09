from memory import load_memory, save_memory
from colorama import Fore, Style, init
from searcher import search_on_web
from executor import execute
import requests
import re

init()

def send_to_ai(conversation_history):
    url = "https://api.groq.com/openai/v1/chat/completions"
    headers = {
        "Authorization": "Bearer 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",
        "Content-Type": "application/json"
    }
    data = {
        "model": "meta-llama/llama-4-scout-17b-16e-instruct",
        "messages": conversation_history
    }
    
    response = requests.post(url, headers=headers, json=data)
    if response.status_code == 200:
        try:
            return response.json()["choices"][0]["message"]["content"]
        except (KeyError, IndexError) as e:
            print(Fore.RED + "Erro ao interpretar resposta da API." + Style.RESET_ALL)
            print(Fore.YELLOW + f"Resposta recebida: {response.json()}" + Style.RESET_ALL)
    else:
        print(Fore.RED + f"Erro ao conectar com a API: {response.status_code}" + Style.RESET_ALL)
        print(Fore.YELLOW + f"Resposta: {response.text}" + Style.RESET_ALL)
    return "Erro ao obter resposta da AI."

if __name__ == "__main__":
    conversation_history = load_memory()
    print(Fore.BLUE + "- Midnight V2 Project by NotWeird" + Style.RESET_ALL)
    print(Fore.YELLOW + "- Warning: " + Fore.BLUE + ":D <-- this face is cooler than you" + Style.RESET_ALL)

    while True:
        try:
            user_input = input(Fore.GREEN + "\nNotWeird: " + Style.RESET_ALL)
            
            conversation_history.append({"role": "user", "content": user_input})
            response = send_to_ai(conversation_history)
            conversation_history.append({"role": "assistant", "content": response})
            save_memory(user_input, response)

            match_command = re.search(r"\[command\](.*?)\[command\]", response)
            match_search = re.search(r"\[search\](.*?)\[search\]", response)

            if match_command:
                command = match_command.group(1).strip()
                print(Fore.MAGENTA + f"\nExecutando: {command}" + Style.RESET_ALL)
                execute(command)
                print(Fore.BLUE + "\nMidnight: " + Style.RESET_ALL + response)
            elif match_search:
                query = match_search.group(1).strip()
                print(Fore.CYAN + f"\n🔍 Realizando busca por: {query}" + Style.RESET_ALL)
                search_on_web(query)
            else:
                print(Fore.BLUE + "\nMidnight: " + Style.RESET_ALL + response)

        except Exception as e:
            print(Fore.RED + f"\nErro: {e}" + Style.RESET_ALL)