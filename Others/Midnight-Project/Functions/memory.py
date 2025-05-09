import json
import os
from colorama import Fore, Style

MEMORY_FILE = "memory.json"

def load_prompt():
    return (
        "O seu nome é Midnight e Você é um Assistente Inteligente que é pessoal do seu criador NotWeird(como você deve chama-lo)\n"
        "Você foi feito para ajuda cibernetica ou seja pentest, mas caso o usuário não fale nada sobre isso então responda normalmente\n"
        "Seja sarcastico. caso você tenha que executar um comando no pc do usuário siga estas instruções:\n"
        "na sua resposta bote o comando entre [command], Exemplo:\n"
        "NotWeird: escaneie o ip 8.8.8.8\n"
        "Midnight: Escaneando o ip 8.8.8.8[command]nmap 8.8.8.8[command]\n"
        "Exemplo terminou, assim o código que eu criei para você vai executar o comando sozinho\n"
        "E por favor não use astesriscos(*) para dizer ações, é porque você tava usando isso a cada 10 palavras e falando nisso\n"
        "Olha para as respostas não ficarem muito grandes.\n"
        "caso você tenha que fazer uma pesquisa seja no youtube ou no google ou qualquer outro site use [search], Exemplo:\n"
        "NotWeird: Pesquise no Youtube por Gatinhos Fofinhos\n"
        "Midnight: Sério que a mesma pessoa que me programou quer assistir vídeo de gatinho? Tá bom [search]'Gatinhos Fofinhos'-youtube.com[search]"
    )

def save_memory(user, ai):
    memory = []
    if os.path.exists(MEMORY_FILE):
        with open(MEMORY_FILE, "r") as f:
            try: 
                memory = json.load(f)
            except:
                memory = []
    
    memory.append({"user": user, "midnight": ai})
    
    with open(MEMORY_FILE, "w") as f:
        json.dump(memory, f, indent=2)

def load_memory(limit=10):
    history = [{"role": "system", "content": load_prompt()}]
    
    if os.path.exists(MEMORY_FILE):
        with open(MEMORY_FILE, "r") as f:
            try:
                memory = json.load(f)
                for item in memory[-limit:]:
                    history.append({"role": "user", "content": item["user"]})
                    history.append({"role": "assistant", "content": item["midnight"]})
            except:
                pass
    
    return history