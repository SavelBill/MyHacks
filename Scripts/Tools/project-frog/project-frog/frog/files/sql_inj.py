import requests

# Define the login URL and credentials
login_url = input("Insira a URL= ")
username = input("Insira o Usuario= ")
passs = input("Insira a Senha= ")

payload = {
    "username": username,
    "password": passs
}

# Create a session to persist cookies
session = requests.Session()

# Send the login POST request
response = session.post(login_url, data=payload)

# Check if login was successful
if "Welcome" in response.text:
    print("Login successful!")
else:
    print("Login failed.")
    print(response.text)

# Access another page that requires login
#protected_url = "https://example.com/protected"
#protected_page = session.get(protected_url)
#print(protected_page.text)