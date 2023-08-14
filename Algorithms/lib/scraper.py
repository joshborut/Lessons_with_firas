from bs4 import BeautifulSoup
import requests
import time
import concurrent.futures
from selenium import webdriver

# Headers reduce the chances of the scraper being detected by making it seem more "human"
HEADERS = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36",
    "Accept-Language": "en-US,en;q=0.9,ja;q=0.8",
    "Referer": "https://google.com",
    "DNT": "1"
}
URL = "https://pub.dev"
MAX_THREADS = 10

# Used when dealing with webpages that need js to load
DRIVER = webdriver.Safari()

sub_pages = []


def parse_main_page():
    DRIVER.get(URL)
    time.sleep(0.5)

    # response = requests.get(URL, timeout=5, headers=HEADERS)
    # soup = BeautifulSoup(response.text, "html.parser")
    soup = BeautifulSoup(DRIVER.page_source, "html.parser")

    for element in soup.find_all(attrs={"class": "mini-list-item"}):
        page_extension = element.find("a")["href"]
        if page_extension is not None:
            # gather_dependencies(URL + page_extension)
            sub_pages.append(URL + page_extension)

    threads = min(MAX_THREADS, len(sub_pages))

    with concurrent.futures.ThreadPoolExecutor(max_workers=threads) as executor:
        executor.map(gather_dependencies, sub_pages)


def gather_dependencies(url):
    print(f"Popular packages: {url}")
    print("Dependencies:")

    response = requests.get(url, timeout=5, headers=HEADERS)
    soup = BeautifulSoup(response.text, "html.parser")

    for element in soup.find_all(attrs={"class": "detail-info-box"}):
        a_elements = element.find_all("a", title=True)
        for a in a_elements:
            print(a["href"])
    print("\n")


def main():
    t_zero = time.time()
    parse_main_page()
    t_one = time.time()
    print(f"{t_one - t_zero} seconds to scrape {len(sub_pages)} pages.")


main()