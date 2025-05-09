import dns.resolver
from colorama import Fore, Style

res = dns.resolver.Resolver()
file = open("list.txt", "r")
subdomain = file.read().splitlines()

print()
target = input("Escolha o Site= ")
print()

for subdomain in subdomain:
    try:
        sub_target = subdomain + "." + target
        dnsresult = res.resolve(sub_target, "A")
        for ip in dnsresult:
            print(Fore.GREEN + sub_target, "->", ip)
    except:
        pass
print()
print(Style.RESET_ALL + "Processo Finalizado!")