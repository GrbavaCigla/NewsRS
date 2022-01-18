"""
Script to fetch fonts and put them in assets/fonts/ directory.
"""

import requests
from os.path import dirname, join


FONTS = [
    "https://www.1001fonts.com/download/font/comic-runes.regular.otf",
]

rootdir = dirname(dirname(__file__))

for font_url in FONTS:
    response = requests.get(font_url)

    if response.ok:
        filename = font_url.split("/")[-1]
        filepath = join(rootdir, "assets", "fonts", filename)

        with open(filepath, "wb+") as file:
            file.write(response.content)