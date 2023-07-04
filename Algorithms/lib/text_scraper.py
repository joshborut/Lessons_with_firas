import time
import requests
import concurrent.futures
from bs4 import BeautifulSoup

# Use all-caps for global variables in Python
MAX_THREADS = 10

def parse(url):
    text = ""
    try:
        response = requests.get(url, timeout=5)
        time.sleep(2)

        if response.status_code != 200:
            return False

        print("Processing..." + url)
        response.encoding = "shift_jis"
        soup = BeautifulSoup(response.text, "html.parser")
        contents = soup.findAll("body")
        if contents is not None:
            for content in contents:
                text = content.find(class_="title").get_text()
    except Exception as ex:
        print(str(ex))
    finally:
        with open('scraped_data.txt', 'a+', encoding="utf-8") as file:
            file.write(text + "\n")


parse("https://www.aozora.gr.jp/cards/001311/card50254.html")
