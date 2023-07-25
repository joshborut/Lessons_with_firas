import requests
from bs4 import BeautifulSoup


def parse(url):
    text = ""
    try:
        response = requests.get(url, timeout=5)
        if response.status_code != 200:
            return False

        print("Processing..." + url)
        response.encoding = "shift_jis"
        soup = BeautifulSoup(response.text, "html.parser")
        content = soup.find("body")
        if content is not None:
            text = content.find(class_="main_text").text
            print(text)

    except Exception as ex:
        print(str(ex))
    finally:
        with open('scraped_data.txt', 'a+', encoding="utf-8") as file:
            file.write(text + "\n")


parse("https://www.aozora.gr.jp/cards/000311/files/4225_14804.html")
