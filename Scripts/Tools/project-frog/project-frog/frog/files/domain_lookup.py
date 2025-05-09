import whois
from colorama import Fore, Style

print()
site = input("Escolha o Site= ")
print(Fore.GREEN)

domain_info = whois.whois(site)
print(domain_info)
print()
print(Style.RESET_ALL + "Processo Finalizado!")