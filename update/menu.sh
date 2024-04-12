#!/bin/bash
clear
m='\033[1;31m' # warna merah
yy='\033[1;33m' # warna kuning
y='\033[0;33m' # warna kuning
wh='\033[0m' # warna putih

# Mendapatkan informasi ISP, timezone, kota, tanggal, dan domain
ISP=$(curl -s ipinfo.io/org | awk -F' ' '{print $1}')
WKT=$(timedatectl | grep "Time zone" | awk '{print $3}')
CITY=$(curl -s http://ip-api.com/json | jq -r '.city')
DATE=$(date +"%Y-%m-%d")
domain=$(cat /root/domain)

# Mendapatkan status NGINX dan XRAY
status_nginx=$(systemctl is-active nginx)
status_xray=$(systemctl is-active xray)

# Mendapatkan informasi bandwidth
dtoday=$(vnstat --json | jq '.interfaces[0].traffic.days[0].rx')
utoday=$(vnstat --json | jq '.interfaces[0].traffic.days[0].tx')
ttoday=$(vnstat --json | jq '.interfaces[0].traffic.days[0].total')
dmon=$(vnstat --json | jq '.interfaces[0].traffic.months[0].rx')
umon=$(vnstat --json | jq '.interfaces[0].traffic.months[0].tx')
tmon=$(vnstat --json | jq '.interfaces[0].traffic.months[0].total')

echo -e "${y}                        ♥ MENU  VPN PRO DUA MASE ♥                        ${wh}"
echo -e "${m} ┌───────────────────────────────────────────────────────────────────────┐${wh}"
echo -e "${yy}│ 1.  SSH & OpenVPN MENU                 8.  VMESS MENU                 │${wh}"
echo -e "${yy}│ 2.  L2TP MENU                          9.  VLESS MENU                 │${wh}"
echo -e "${yy}│ 3.  PPTP MENU                          10. TROJAN GFW MENU            │${wh}"
echo -e "${yy}│ 4.  SSTP MENU                          11. TROJAN GO MENU             │${wh}"
echo -e "${yy}│ 5.  WIREGUARD MENU                     12. Settings                   │${wh}"
echo -e "${yy}│ 6.  SHADOWSOCKS MENU                   13. Exit                       │${wh}"
echo -e "${m} └───────────────────────────────────────────────────────────────────────┘${wh}"
echo -e " ${y}╔═══════════════════════════════════════════════════════════════════════╗${wh}"
echo -e " ${y}║                           Informasi Tambahan                          ║${wh}"
echo -e " ${y}╠═══════════════════════════════════════════════════════════════════════╣${wh}"
echo -e " ${y}║ ${wh}ISP                        : $ISP${y}                            ║${wh}"
echo -e " ${y}║ ${wh}Lokasi Waktu               : $WKT${y}                            ║${wh}"
echo -e " ${y}║ ${wh}Kota                       : $CITY${y}                           ║${wh}"
echo -e " ${y}║ ${wh}Thn/Bln/Tgl                : $DATE${y}                           ║${wh}"
echo -e " ${y}║ ${wh}Domain                     : $domain${y}                         ║${wh}"
echo -e " ${y}╚═══════════════════════════════════════════════════════════════════════╝${wh}"
echo -e "${m}——————————————————————————————————————————————————————————————————————————${wh}"
echo -e "${yy}NGINX STATUS${wh}: $status_nginx    ${yy}XRAY STATUS${wh}: $status_xray  ${wh}"
echo -e "${m}——————————————————————————————————————————————————————————————————————————${wh}"
# Menampilkan informasi pemantauan bandwidth di tengah
center_align=$(( ($term_width - 44) / 2 ))
space_padding=$(printf '%0.1s' " "{1..600})
echo -e "${space_padding:0:$center_align}${yy}----- [ Pemantauan Bandwidth ] -----${wh}"
echo -e "${m}——————————————————————————————————————${wh}"
echo -e "${space_padding:0:$center_align} ${yl}↓↓ Down:${wh} $dtoday${space_padding:0:$center_align-23} ${yl}↓↓ Down:${wh} $dmon"
echo -e "${space_padding:0:$center_align} ${yl}↑↑ Up  :${wh} $utoday${space_padding:0:$center_align-21} ${yl}↑↑ Up  :${wh} $umon"
echo -e "${space_padding:0:$center_align} ${yl}≈ Total:${wh} $ttoday${space_padding:0:$center_align-23} ${yl}≈ Total:${wh} $tmon"
echo -e "${m}——————————————————————————————————————${wh}"

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
