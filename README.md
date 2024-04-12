### Command Install

```
rm -f setup.sh && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/10ribuadm/scriptvps/main/setup.sh && chmod +x setup.sh && ./setup.sh
```
#### Cara Gampang Tanpa Update
```
1.
rm -f setup.sh 
```
2.
sysctl -w net.ipv6.conf.all.disable_ipv6=1
``` 
3.
sysctl -w net.ipv6.conf.default.disable_ipv6=1
```
4.
apt install -y bzip2 gzip coreutils screen curl unzip
```
5. 
wget https://raw.githubusercontent.com/10ribuadm/scriptvps/main/setup.sh
```
chmod +x setup.sh
7.
./setup.sh
```
