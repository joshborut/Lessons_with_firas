from bs4 import BeautifulSoup
import requests

URL = "https://pub.dev"

response = requests.get(URL, timeout=5)
soup = BeautifulSoup(response.text, "html.parser")

for element in soup.findAll(attrs={"class": "mini-list-item"}):
    page_extension = element.find("a")["href"]
    if page_extension is not None:
        print(URL + page_extension)

