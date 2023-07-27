from bs4 import BeautifulSoup
import requests

URL = "https://pub.dev"


def parse_main_page():
    response = requests.get(URL, timeout=5)
    soup = BeautifulSoup(response.text, "html.parser")

    for element in soup.find_all(attrs={"class": "mini-list-item"}):
        page_extension = element.find("a")["href"]
        if page_extension is not None:
            gather_dependencies(URL + page_extension)


def gather_dependencies(url):
    print(f"Popular packages: {url}")
    print("Dependencies:")

    response = requests.get(url, timeout=5)
    soup = BeautifulSoup(response.text, "html.parser")

    for element in soup.find_all(attrs={"class": "detail-info-box"}):
        a_elements = element.find_all("a", title=True)
        for a in a_elements:
            print(a["href"])
    print("\n")


parse_main_page()
