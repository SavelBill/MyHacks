# search_executor.py
from colorama import Fore, Style
from bs4 import BeautifulSoup
import requests

def search_on_web(query: str, limit=30):
    print(Fore.CYAN + f"\n🔍 Pesquisando por: '{query}'..." + Style.RESET_ALL)

    # Montando a URL para a busca no Google
    search_url = f"https://www.google.com/search?q={query}"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
    }

    response = requests.get(search_url, headers=headers)

    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')
        links = []

        # Procurando todos os links nos resultados de busca
        for item in soup.find_all('a', href=True):
            href = item['href']
            if "url?q=" in href and "webcache.googleusercontent.com" not in href:
                url = href.split("url?q=")[1].split("&sa=U")[0]
                if url.startswith("http"):
                    links.append(url)
            if len(links) >= limit:
                break

        # 🔹 Exibindo os links encontrados
        if links:
            print(Fore.GREEN + f"\n✔️ Encontrados {len(links)} resultados:" + Style.RESET_ALL)
            for index, link in enumerate(links, 1):
                print(Fore.YELLOW + f"{index}. {link}" + Style.RESET_ALL)
        else:
            print(Fore.RED + "❌ Nenhum link encontrado." + Style.RESET_ALL)
    else:
        print(Fore.RED + "❌ Falha ao realizar a pesquisa." + Style.RESET_ALL)
