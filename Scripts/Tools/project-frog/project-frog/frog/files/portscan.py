import socket
from colorama import Fore, Style

ports = [20,
    21,
    2,
    23,
    25,
    53,
    67,
    68,
    80,
    110,
    3,
    123,
    143,
    161,
    162,
    194,
    443,
    465,
    514,
    993,
    995,
    1024,
    49151,
    1433,
    1434,
    1521,
    3306,
    3389,
    5432,
    5900,
    5999,
    8080,
    8443,
    27017, 21,22,80,71,70,443,445,3306,25,8080]

print()
site = input("Escolha o Site= ")
print(Fore.GREEN)

for port in ports:
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.settimeout(0.1)
    code = client.connect_ex((site, port))
    if code == 0:
        print(port, "ABERTA")

print(Style.RESET_ALL)
print("Portscan Terminado!")