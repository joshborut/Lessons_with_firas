# from requests_html import HTMLSession
import requests

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36",
    "Accept-Language": "en-US,en;q=0.9,ja;q=0.8",
    "Referer": "https://google.com",
    "DNT": "1"
}

URL = "https://httpbin.org/headers"

r = requests.get(URL, headers=HEADERS)

print(r.text)
