#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"

# Mendapatkan informasi ISP, timezone, kota, tanggal, dan domain
ISP=$(curl -s ifconfig.me)
WKT=$(timedatectl | grep "Time zone" | awk '{print $3}')
CITY=$(curl -s http://ip-api.com/json | jq -r '.city')
DATE=$(date +"%Y-%m-%d")
domain=$(hostname -f)

# Mendapatkan status NGINX dan XRAY
status_nginx=$(systemctl is-active nginx)
status_xray=$(systemctl is-active xray)

# Mendapatkan informasi bandwidth
dtoday=$(vnstat --json | jq '.interfaces[] | .traffic.day.rx')
utoday=$(vnstat --json | jq '.interfaces[] | .traffic.day.tx')
ttoday=$(vnstat --json | jq '.interfaces[] | .traffic.day.total')
dmon=$(vnstat --json | jq '.interfaces[] | .traffic.month.rx')
umon=$(vnstat --json | jq '.interfaces[] | .traffic.month.tx')
tmon=$(vnstat --json | jq '.interfaces[] | .traffic.month.total')

echo -e "$y                  MENU  $wh"
echo -e "$y-------------------------------------------------$wh"
echo -e "$yy 1$y.  SSH & OpenVPN MENU     $yy 2$y.  L2TP MENU           $yy 3$y.  PPTP MENU$wh"
echo -e "$yy 4$y.  SSTP MENU              $yy 5$y.  WIREGUARD MENU      $yy 6$y.  SHADOWSOCKS MENU$wh"
echo -e "$yy 7$y.  SHADOWSOCKSR MENU     $yy 8$y.  VMESS MENU           $yy 9$y.  VLESS MENU$wh"
echo -e "$yy 10$y. TROJAN GFW MENU        $yy 11$y. TROJAN GO MENU      $yy 12$y. Settings$wh"
echo -e "$yy 13$y. Exit$wh"
echo -e "$y-------------------------------------------------$wh"

# Menampilkan informasi tambahan
echo -e " ${y}Service Provider${wh}: $ISP"
echo -e " ${y}Timezone${wh}         : $WKT"
echo -e " ${y}City${wh}             : $CITY"
echo -e " ${y}Date${wh}             : $DATE"
echo -e " ${y}Domain${wh}           : $domain"
echo -e "${m}————————————————————————————————————————————————————————${wh}"
echo -e "     ${yy}NGINX STATUS${wh}: $status_nginx    ${yy}XRAY STATUS${wh}: $status_xray   "
echo -e "${m}————————————————————————————————————————————————————————${wh}"
echo -e "          ${yy}----- [ Pemantauan Bandwidth ] -----${wh}"
echo -e ""
echo -e "  ${yl}Hari Ini ($DATE)     Bulanan ($(date +%B/%Y))${wh}      "
echo -e "${m}————————————————————————————————————————————————————————${wh}"
echo -e "    ${yl}↓↓ Down:${wh} $dtoday          ${yl}↓↓ Down:${wh} $dmon   "
echo -e "    ${yl}↑↑ Up  :${wh} $utoday          ${yl}↑↑ Up  :${wh} $umon   "
echo -e "    ${yl}≈ Total:${wh} $ttoday          ${yl}≈ Total:${wh} $tmon   "

read -p "Pilih dari Opsi [ 1 - 13 ] : " menu

case $menu in
1)
    clear
    sshovpnmenu
    ;;
2)
    clear
    l2tpmenu
    ;;
3)
    clear
    pptpmenu
    ;;
4)
    clear
    sstpmenu
    ;;
5)
    clear
    wgmenu
    ;;
6)
    clear
    ssmenu
    ;;
7)
    clear
    ssrmenu
    ;;
8)
    clear
    vmessmenu
    ;;
9)
    clear
    vlessmenu
    ;;
10)
    clear
    trmenu
    ;;
11)
    clear
    trgomenu
    ;;
12)
    clear
    setmenu
    ;;
13)
    clear
    exit
    ;;
*)
    clear
    menu
    ;;
esac
