## convert python file to executable binary file

### install pyinstaller

```
pipx install pyinstaller
```

> pipx is recommended in Linux environment, see (pipx intro)[https://github.com/pypa/pipx]

### make it happen

```
pyinstaller --onefile --noconsole [python script file].py
```
