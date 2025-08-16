## convert pdf to ebook

1. if pdf based on image, convert to text-based:
```sh
pipx install ocrmypdf
# install missing dependency engine with language support(chinese simplified)
sudo apt install tesseract-ocr tesseract-ocr-chi-sim
```

2. convert pdf:
```sh
# with specific language
ocrmypdf --lang chi_sim --force-ocr source.pdf target.pdf
```


3. for best result, use python with package `pdfplumber` to convert pdf to text
```python
import pdfplumber

with pdfplumber.open("ocr_source.pdf") as pdf:
    text = ""
    for page in pdf.pages:
        text += page.extract_text() + "\n"
    with open("target.txt", "w", encoding="utf-8") as f:
        f.write(text)
```

4. install `calibre` and use binary tool `ebook-convert` from text file to epub
```sh
ebook-convert source.txt target.epub
```


