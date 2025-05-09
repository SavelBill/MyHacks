import requests
from colorama import Fore, Style

def get_ip_location(ip_address):
    try:
        url = f"http://ip-api.com/json/{ip_address}"
        response = requests.get(url)
        data = response.json()

        if data["status"] == "success":
            return {
                "IP": ip_address,
                "País": data.get("country"),
                "Região": data.get("regionName"),
                "Cidade": data.get("city"),
                "Latitude": data.get("lat"),
                "Longitude": data.get("lon"),
                "Provedor": data.get("isp"),
            }
        else:
            return {"Erro": data.get("message", "Não foi possível localizar o IP")}

    except Exception as e:
        return {"Erro": str(e)}

if __name__ == "__main__":
    print()
    ip = input("Insira o Endereço IP= ")
    print(Fore.GREEN)
    result = get_ip_location(ip)
    for key, value in result.items():
        print(f"{key}: {value}")
    print()
    print(Style.RESET_ALL + "Processo Finalizado!")