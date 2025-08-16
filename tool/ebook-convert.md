## convert pdf to ebook

1. if pdf based on image, convert to text-based:
```sh
pipx install ocrmypdf
# install missing dependency
sudo apt install tesseract-ocr
```

2. convert pdf:
```sh
ocrmypdf source.pdf target.pdf
```

3. install `calibre` and use binary tool `ebook-convert` from pdf to epub
```sh
ebook-convert source.pdf target.epub
```


