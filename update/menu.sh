#!/bin/bash
clear
m='\033[1;31m' # warna merah
yy='\033[1;33m' # warna kuning
y='\033[0;33m' # warna kuning
wh='\033[0m' # warna putih
hj='\e[1;32m' # hijau

# Mendapatkan informasi ISP, timezone, kota, tanggal, dan domain
ISP="Digital Ocean"
WKT=$(timedatectl | grep "Time zone" | awk '{print $3}')
CITY="Jakarta"
DATE=$(date +"%Y-%m-%d")
domain=$(cat /root/domain)

# Mendapatkan status NGINX dan XRAY
status_nginx=$(systemctl is-active nginx)
status_xray=$(systemctl is-active xray)

# Mendapatkan informasi bandwidth
dtoday=$(vnstat --json | jq -r '.interfaces[0].traffic.days[0].rx // "Data tidak tersedia"')
utoday=$(vnstat --json | jq -r '.interfaces[0].traffic.days[0].tx // "Data tidak tersedia"')
ttoday=$(vnstat --json | jq -r '.interfaces[0].traffic.days[0].total // "Data tidak tersedia"')
dmon=$(vnstat --json | jq -r '.interfaces[0].traffic.months[0].rx // "Data tidak tersedia"')
umon=$(vnstat --json | jq -r '.interfaces[0].traffic.months[0].tx // "Data tidak tersedia"')
tmon=$(vnstat --json | jq -r '.interfaces[0].traffic.months[0].total // "Data tidak tersedia"')





echo -e "${y}███████████████████████ ♥ MENU  VPN PRO DUA MASE ♥ ████████████████████████${wh}"
echo -e "${m} ┌───────────────────────────────────────────────────────────────────────┐${wh}"
echo -e "${yy} │ 1.  SSH & OpenVPN MENU                 8.  VMESS MENU                 │${wh}"
echo -e "${yy} │ 2.  L2TP MENU                          9.  VLESS MENU                 │${wh}"
echo -e "${yy} │ 3.  PPTP MENU                          10. TROJAN GFW MENU            │${wh}"
echo -e "${yy} │ 4.  SSTP MENU                          11. TROJAN GO MENU             │${wh}"
echo -e "${yy} │ 5.  WIREGUARD MENU                     12. Settings                   │${wh}"
echo -e "${yy} │ 6.  SHADOWSOCKS MENU                   13. Exit                       │${wh}"
echo -e "${m} └───────────────────────────────────────────────────────────────────────┘${wh}"
echo -e " ${y}╔═══════════════════════════════════════════════════════════════════════╗${wh}"
echo -e " ${y}║                           Informasi Tambahan                          ║${wh}"
echo -e " ${y}╠═══════════════════════════════════════════════════════════════════════╣${wh}"
echo -e " ${y}║ ${wh}ISP                        : \e[1;32m${ISP}${y}                            ║${wh}"
echo -e " ${y}║ ${wh}Lokasi Waktu               : \e[1;32m$WKT${y}                             ║${wh}"
echo -e " ${y}║ ${wh}Kota                       : \e[1;32m$CITY${y}                                  ║${wh}"
echo -e " ${y}║ ${wh}Thn/Bln/Tgl                : \e[1;32m$DATE${y}                               ║${wh}"
echo -e " ${y}║ ${wh}Domain                     : \e[1;32m$domain${y}                            ║${wh}"
echo -e " ${y}╚═══════════════════════════════════════════════════════════════════════╝${wh}"
echo -e "${m} —————————————————————————————————————————————————————————————————————————${wh}"
echo -e "${yy}        	NGINX STATUS${hj}: $status_nginx    ${yy}XRAY STATUS${hj}: $status_xray  ${wh}"
echo -e "${m} —————————————————————————————————————————————————————————————————————————${wh}"
# Menampilkan informasi pemantauan bandwidth di tengah

echo -e "${m} ╔═══════════════════════════════════════════════════════════════════════╗"
echo -e " ║                 	   ${cyan}Informasi Bandwidth            ${m}		 ║"
echo -e " ╠═══════════════════════════════════════════════════════════════════════╣"
echo -e " ║  ${yy}📥 Download bulan ini	: $dmon      ${blue}		 ║"
echo -e " ║  ${yy}📤 Upload bulan ini		: $umon        ${blue}		 ║"
echo -e " ║  ${yy}💡 Total  bulan ini	 	: $tmon       ${blue}		 ║"
echo -e " ╚═══════════════════════════════════════════════════════════════════════╝${reset}"



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
