## install and start

1. add debian backports(trixie):
```sh
# Modernized from /etc/apt/sources.list
Types: deb
URIs: https://mirrors.tuna.tsinghua.edu.cn/debian/
Suites: trixie-backports
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
```


2. install from backports
```sh
sudo apt update
sudo apt install -t trixie-backports -y tlp
```

3. edit `/etc/tlp.conf` to suit my needs
the file is backup under the same directory here

4. run with systemd:
```sh
sudp tlp start
```
