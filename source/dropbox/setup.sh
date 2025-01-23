#!/bin/bash
#CREADOR Henry Chumo | 25/08/2022
#Alias : @ChumoGH
# -*- ENCODING: UTF-8 -*-
apt --fix-broken install
#apt update && apt list --upgradabe && apt upgrade -y
apt update && apt list --upgradeable && apt upgrade -y
export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games;
fecha=`date +"%d-%m-%y"`;
SCPdir="$(echo -e $(echo 2F41444D636768|sed 's/../\\x&/g;s/$/ /'))"
SCPinstal="$HOME/install"
rm -f instala.*
[[ -e /etc/folteto ]] && rm -f /etc/folteto
[[ ! -z $1 ]] && {
[[ "$1" == '--ADMcgh' ]] && echo -e " ESPERE UN MOMENTO $1" || {
exit&&exit
}
rm -f wget*
apt-get install curl -y &>/dev/null
apt install sudo -y &> /dev/null
source <(curl -sSL https://raw.githubusercontent.com/ChumoGH/ChumoGH-Script/master/msg-bar/msg)
_double=$(curl -sSL "https://raw.githubusercontent.com/xplhack/CHUMOD/refs/heads/main/source/Control-Bot.txt")
COLS=$(tput cols)
os_system(){ 
 system=$(cat -n /etc/issue |grep 1 |cut -d ' ' -f6,7,8 |sed 's/1//' |sed 's/      //') 
 distro=$(echo "$system"|awk '{print $1}') 
 case $distro in 
 Debian)vercion=$(echo $system|awk '{print $3}'|cut -d '.' -f1);; 
 Ubuntu)vercion=$(echo $system|awk '{print $2}'|cut -d '.' -f1,2);; 
 esac 
 }

rutaSCRIPT () {
rm -f setup.sh*
act_ufw() {
[[ -f "/usr/sbin/ufw" ]] && ufw allow 81/tcp ; ufw allow 8888/tcp
}
[[ -z $(cat /etc/resolv.conf | grep "8.8.8.8") ]] && echo "nameserver	8.8.8.8" >> /etc/resolv.conf
[[ -z $(cat /etc/resolv.conf | grep "1.1.1.1") ]] && echo "nameserver	1.1.1.1" >> /etc/resolv.conf
cd $HOME

fun_ip () {
  if [[ -e /bin/ejecutar/IPcgh ]]; then
    IP="$(cat /bin/ejecutar/IPcgh)"
  else
    MEU_IP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
    MEU_IP2=$(wget -qO- ipv4.icanhazip.com)
    [[ "$MEU_IP" != "$MEU_IP2" ]] && IP="$MEU_IP2" && echo "$MEU_IP2" || IP="$MEU_IP" && echo "$MEU_IP"
    echo "$MEU_IP2" > /bin/ejecutar/IPcgh
	IP="$MEU_IP2"
  fi
}

fun_install () {
clear
valid_fun
msg -bar3
cd $HOME
[[ -e $HOME/lista ]] && rm -f $HOME/lista*
[[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal} 
}

## root check

if ! [ $(id -u) = 0 ]; then
clear
		echo ""
		echo " _________________________________________________"
		echo " 	           	⛑⛑⛑     Error Fatal!! x000e1  ⛑⛑⛑"
		echo " _________________________________________________"
		echo "                    ✠ Este script debe ejecutarse como root! ✠"

		echo "                              Como Solucionarlo "
		
		echo "                            Ejecute el script así:"
		echo "                               ⇘     ⇙ "
		echo "                                (  sudo -i )"
		echo "                                   sudo su"
		echo "                                 Retornando . . ."
		echo $(date)
		exit
fi


function_verify () {
echo "verify" > $(echo -e $(echo 2f62696e2f766572696679737973|sed 's/../\\x&/g;s/$/ /'))
#este devuelve /usr/lib/licence
echo 'MOD @ChumoGH ChumoGHADM' > $(echo -e $(echo 2F7573722F6C69622F6C6963656E6365|sed 's/../\\x&/g;s/$/ /'))
#echo -e $(echo 2f62696e2f766572696679737973|sed 's/../\\x&/g')
#este devuelve /bin/verifysys
[[ $(dpkg --get-selections|grep -w "libpam-cracklib"|head -1) ]] || apt-get install libpam-cracklib -y &> /dev/null
echo -e '# Modulo @ChumoGH
password [success=1 default=ignore] pam_unix.so obscure sha512
password requisite pam_deny.so
password required pam_permit.so' > /etc/pam.d/common-password && chmod +x /etc/pam.d/common-password
}

verificar_arq () {
[[ ! -d ${SCPdir} ]] && mkdir ${SCPdir}
mv -f ${SCPinstal}/$1 ${SCPdir}/$1 && chmod +x ${SCPdir}/$1
}
fun_ip

valid_fun () {
_check2BOT="$(echo -e "$_double" | grep ${IiP} | awk '{print $5}')"
_check2RES="$(echo -e "$_double" | grep ${IiP} | awk '{print $7}')"
msg -bar3
echo -e ""
echo -e "${cor[2]}\n\033[1;37m  SCRIPT DESARROLLADO por: @ChumoGH - Henry Chumo" | pv -qL 12
echo -e ""
msg -bar3
echo -e "  ${cor[5]} ADMcgh OFICIAL/ChumoGH-Plus REFACTORIZADO 2023" 
msg -bar3
echo -e "${cor[3]}     VERIFICANDO RAIZ DE DATOS DE LA LLAVE !!! "
echo ""

SCPdir="$(echo -e $(echo 2F41444D636768|sed 's/../\\x&/g;s/$/ /'))"
#/ADMc hg
echo '#!/bin/bash
# Creado por @ChumoGH
SCPdir="/ADMcgh"
cd ${SCPdir} && ./menu' > /bin/menu && chmod +x /bin/menu
echo '#!/bin/bash
# Creado por @ChumoGH
SCPdir="/ADMcgh"
cd ${SCPdir} && ./menu' > /bin/cgh && chmod +x /bin/cgh
echo '#!/bin/bash
# Creado por @ChumoGH
SCPdir="/ADMcgh"
cd ${SCPdir} && ./menu' > /bin/adm && chmod +x /bin/adm
msg -bar3
[[ -e ${SCPdir}/menu_credito ]] && ress="$(cat ${SCPdir}/menu_credito|head -1) " || ress="NULL ( no found ) "
echo -ne "${cor[2]}\n\033[1;37m  RESELLER  : " | pv -qL 50 && sleep 1s && echo -e "\033[0;35m$ress" | pv -qL 50
echo
msg -bar3
echo -ne "${cor[2]}\033[1;37m BOT -> " && sleep 1s && echo -ne "\033[0;35m$_check2BOT" | pv -qL 30 | lolcat 
echo -ne "${cor[2]}\033[1;37m  ADMIN : " && sleep 1s && echo -ne "\033[0;35m$_check2RES" | pv -qL 30 | lolcat
echo ""

unset _auBT
if [[ ! -e /etc/systemd/system/cacheflush.service ]]; then
	msg -bar
	echo -ne "\033[1;97m Poner en linea AUTOBOOT [s/n]: "
	read _auBT
	msg -bar
[[ $_auBT = @(s|S|y|Y) ]] && {
echo -e "[Unit]
Description=AutoBoot Service by @ChumoGH
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/bin/bash /bin/autoboot
Restart=always
RestartSec=10s

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/cacheflush.service
	systemctl enable cacheflush &>/dev/null
	systemctl start cacheflush &>/dev/null
	systemctl daemon-reload &>/dev/null
	msg -bar
	echo -e "\033[1;31m Reactivador de Protocolos ENCENDIDO!!"
	msg -bar
	}
else
killall /bin/autoboot &>/dev/null
systemctl stop cacheflush &>/dev/null
systemctl disable cacheflush &>/dev/null
rm /etc/systemd/system/cacheflush.service &>/dev/null
clear
msg -bar
echo -e "\033[1;31m REACTIVADOR DE PROTOCOLOS DESABILITADO"
msg -bar
fi


[[ -e ${SCPdir}/header ]] && bash ${SCPdir}/header --instalar
}

error_conex () {
[[ -e $HOME/lista-arq ]] && list_fix="$(cat < $HOME/lista-arq)" || list_fix=""
msg -bar3 
echo -e "\033[41m     --      SISTEMA ACTUAL $(lsb_release -si) $(lsb_release -sr)      --"
[[ "$list_fix" = "" ]] && {
msg -bar3 
echo -e " ERROR (PORT 8888 TCP) ENTRE GENERADOR <--> VPS "
echo -e "    NO EXISTE CONEXION ENTRE EL GENERADOR "
echo -e "  - \e[3;32mGENERADOR O KEYGEN COLAPZADO\e[0m - "
}
invalid_key
}

invalid_key () {
[[ $1 == '--ban' ]] && {
cd $HOME 
service ssh stop
[[ -e ${SCPinstal} ]] && rm -rf ${SCPinstal}
[[ -d $HOME/chumogh ]] && rm -rf $HOME/chumogh
[[ -d ${SCPdir} ]] && rm -rf ${SCPdir}
[[ -d $HOME/chumogh ]] && rm -rf $HOME/chumogh
[[ -e /bin/menu ]] && rm /bin/menu
[[ -e $HOME/chumogh ]] && rm -rf $HOME/chumogh
[[ -e $HOME/log.txt ]] && rm -f $HOME/log.txt
[[ -e /bin/troj.sh ]] && rm -f /bin/troj.sh
[[ -e /bin/v2r.sh ]] && rm -f /bin/v2r.sh
[[ -e /bin/clash.sh ]] && rm -f /bin/clash.sh
rm -f instala.*  > /dev/null
rm -f /bin/cgh > /dev/null
rm -rf /bin/ejecutar > /dev/null
figlet " Key Invalida" | boxes -d stone -p a2v1 > error.log
msg -bar3 >> error.log
echo "  KEY NO PERMITIDA, ADQUIERE UN RESELLER OFICIAL" >> error.log
echo "  ----------------------------------------------" >> error.log
echo "  KEY NO PERMITIDA, ADQUIERE UN RESELLER OFICIAL" >> error.log
echo "  ----------------------------------------------" >> error.log
echo -e ' https://t.me/ChumoGH  - @ChumoGH' >> error.log
msg -bar3 >> error.log
cat error.log | lolcat
exit&&exit&&exit&&exit
}
[[ -e $HOME/lista-arq ]] && list_fix="$(cat < $HOME/lista-arq)" || list_fix=''
echo -e ' '
msg -bar3 
#echo -e "\033[41m     --      SISTEMA ACTUAL $(lsb_release -si) $(lsb_release -sr)      --"
echo -e " \033[41m-- CPU :$(lscpu | grep "Vendor ID" | awk '{print $3}') SISTEMA : $(lsb_release -si) $(lsb_release -sr) --"
[[ "$list_fix" = "" ]] && {
msg -bar3 
echo -e " ERROR (PORT 8888 TCP) ENTRE GENERADOR <--> VPS "
echo -e "    NO EXISTE CONEXION ENTRE EL GENERADOR "
echo -e "  - \e[3;32mGENERADOR O KEYGEN COLAPZADO\e[0m - "
}
[[ "$list_fix" = "KEY INVALIDA!" ]] && {
IiP="$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"
cheklist="$(curl -sSL $IiP:81/ChumoGH/checkIP.log)"
chekIP="$(echo -e "$cheklist" | grep ${Key} | awk '{print $3}')"
chekDATE="$(echo -e "$cheklist" | grep ${Key} | awk '{print $7}')"
msg -bar3
echo ""
[[ ! -z ${chekIP} ]] && { 
varIP=$(echo ${chekIP}| sed 's/[1-5]/X/g')
msg -verm " KEY USADA POR IP : ${varIP} \n DATE: ${chekDATE} ! "
echo ""
msg -bar3
} || {
echo -e "    PRUEBA COPIAR BIEN TU KEY "
[[ $(echo "$(ofus "$Key"|cut -d'/' -f2)" | wc -c ) = 18 ]] && echo -e "" || echo -e "\033[1;31m CONTENIDO DE LA KEY ES INCORRECTO"
echo -e "   KEY NO COINCIDE CON EL CODEX DEL ADM "
msg -bar3
tput cuu1 && tput dl1
}
}
msg -bar3
[[ $(echo "$(ofus "$Key"|cut -d'/' -f2)" | wc -c ) = 18 ]] && echo -e "" || echo -e "\033[1;31m CONTENIDO DE LA KEY ES INCORRECTO"
[[ -e $HOME/lista-arq ]] && rm $HOME/lista-arq
cd $HOME 
[[ -e ${SCPinstal} ]] && rm -rf ${SCPinstal}
[[ -d $HOME/chumogh ]] && rm -rf $HOME/chumogh
[[ -d ${SCPdir} ]] && rm -rf ${SCPdir}
[[ -d $HOME/chumogh ]] && rm -rf $HOME/chumogh
[[ -e /bin/menu ]] && rm /bin/menu
[[ -e $HOME/chumogh ]] && rm -rf $HOME/chumogh
[[ -e $HOME/log.txt ]] && rm -f $HOME/log.txt
[[ -e /bin/troj.sh ]] && rm -f /bin/troj.sh
[[ -e /bin/v2r.sh ]] && rm -f /bin/v2r.sh
[[ -e /bin/clash.sh ]] && rm -f /bin/clash.sh
rm -f instala.*  > /dev/null
rm -f /bin/cgh > /dev/null
rm -rf /bin/ejecutar > /dev/null
figlet " Key Invalida" | boxes -d stone -p a2v1 > error.log
msg -bar3 >> error.log
echo "  Key Invalida, Contacta con tu Provehedor" >> error.log
echo -e ' https://t.me/ChumoGH  - @ChumoGH' >> error.log
msg -bar3 >> error.log
cat error.log | lolcat
#msg -bar3
echo -e "    \033[1;44m  Deseas Reintentar con OTRA KEY\033[0;33m  :v"
echo -ne "\033[0;32m "
read -p "  Responde [ s | n ] : " -e -i "n" x
[[ $x = @(s|S|y|Y) ]] && funkey || {
exit&&exit
}
}

funkey () {
unset Keey
while [[ ! $Keey ]]; do
clear
export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games;
echo -e "\n      \033[1;32m DIGITA TU KEY A VERIFICAR "
msg -ne "Script Key: " && read Keey
[[ ! -z $Keey ]] && Keey="$(echo "$Keey" | tr -d '[[:space:]]')"
tput cuu1 && tput dl1
done
REQUEST=$(ofus "$Keey"|cut -d'/' -f2)
echo -e "\n"
echo -e " FILE Contend : ${REQUEST} $(echo ${REQUEST} | wc -c )" 
echo -e "\n"
echo -e " VERIFICA, Si tu key Contiene \033[1;45m KEY DE ChumoGH! \033[0m "
echo -e "\n"
msg -ne " Link Key: http://$(ofus $Keey) \n                      " 
IiP=$(ofus "$Keey" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
[[ $(curl -s --connect-timeout 2 $IiP:8888 )  ]] && echo -e "\033[1;42mCONEXION CON SERVIDOR EXITOSA\033[0m" || echo -e "\033[1;43mCONEXION CON SERVIDOR FALLIDA\033[0m"
wget --no-check-certificate -O $HOME/list-key $(ofus $Keey)/$(wget -qO- ipv4.icanhazip.com)/CHECK-KEY/ > /dev/null 2>&1 && echo -ne "\033[1;32m  [ VERIFICANDO ]" || echo -e "\033[1;31m [ No Existe Acceso al KEY ]" #&& echo -e "\033[1;32m [ Key  ]\n" || echo -e "\033[1;31m [ No Existe Acceso al KEY ]"
ofen=$(wget -qO- $(ofus $Keey))
unset arqx   
[[ -d $HOME/install ]] && rm -rf $HOME/install/* || mkdir $HOME/install
verificar_arq () {
echo "$1" >> $HOME/install/log.txt
echo "FILE -> $1" && _sleepColor '0.5'
#tput cuu1 >&2 && tput dl1 >&2
}
n=1
IP=$(ofus "$Keey" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') && echo "$IP" > /usr/bin/vendor_code
pontos="."
stopping=" COMPROBANDO "|sed -e 's/[^a-z -]//ig'
for arqx in $(cat $HOME/list-key); do
#msg -verm "${stopping}${pontos}" && sleep 0.5s
wget --no-check-certificate -O $HOME/install/${arqx} ${IP}:81/${REQUEST}/${arqx} > /dev/null 2>&1 && verificar_arq "${arqx}"
#tput cuu1 && tput dl1
#pontos+="."
n=$(($n + 1))
done
echo -ne " ---> ESTADO : \033[1;45m$ofen\033[0m  con "
[[ ! -e $HOME/install/log.txt ]] && touch $HOME/install/log.txt
echo " $(cat < $HOME/install/log.txt | wc -l) FILES " && rm -f $HOME/install/log.txt
msg -ne " \033[1;42mESTADO :\033[0m " 
[[ -e $HOME/list-key ]] && {
echo -ne "  "
[[ $ofen = "KEY DE ChumoGH!" ]] && 
echo -e "KEY FUNCIONAL" && rm -f $HOME/list-key && echo -ne "\033[0m" 
} || echo -e " KEY INVALIDA O USADA\033[0m\n"
#curl -s --connect-timeout 2 ${IiP}:81/${REQUEST}/menu_credito > menu_credito
msg -ne " RESELLER del Key :\033[0m  "
[[ -e $HOME/install/menu_credito ]] && {
echo -ne "  "
[[ "$(cat $HOME/install/menu_credito | head -1)" = "" ]] && { echo -e "SIN RESELLER\033[0m" 
} || echo -e "$(cat $HOME/install/menu_credito | head -1)\033[0m" && rm -rf $HOME/install && echo -ne "\033[0m"
} || echo -e " NO HAY CONTENIDO DE KEY Key\033[0m\n"
read -p "Enter"
}

ofus () {
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="x";;
"x")txt[$i]=".";;
"5")txt[$i]="s";;
"s")txt[$i]="5";;
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"4")txt[$i]="0";;
"0")txt[$i]="4";;
"/")txt[$i]="K";;
"K")txt[$i]="/";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}

 
function printTitle
{
    echo ""
    echo -e "\033[1;92m$1\033[1;91m"
    printf '%0.s-' $(seq 1 ${#1})
    echo ""
}
killall apt apt-get &> /dev/null
TIME_START="$(date +%s)"
DOWEEK="$(date +'%u')"
[[ -e $HOME/cgh.sh ]] && rm $HOME/cgh.*

fun_bar () {
comando[0]="$1"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
echo -ne "\033[1;33m ["
while true; do
   for((i=0; i<18; i++)); do
   echo -ne "\033[1;31m##"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;33m]"
   sleep 0.5s
   tput cuu1
   tput dl1
   echo -ne "\033[1;33m ["
done
echo -e "\033[1;33m]\033[1;31m -\033[1;32m 100%\033[1;37m"
}

msg -bar3
printTitle " ORGANIZANDO INTERFAZ DEL INSTALADOR "
echo ""
update_pak () {
echo "" 
[[ $(dpkg --get-selections|grep -w "pv"|head -1) ]] || apt install pv -y &> /dev/null 
os_system 
echo -e "		[ ! ]  ESPERE UN MOMENTO  [ ! ]"
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || apt-get install lolcat -y &>/dev/null 
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null
echo ""
msg -bar3
[[ $(echo -e "${vercion}" | grep -w "22.10") ]] && {
echo -e "\e[1;31m  SISTEMA:  \e[33m$distro $vercion \e[1;31m	CPU:  \e[33m$(lscpu | grep "Vendor ID" | awk '{print $3}')" 
echo 
echo -e " ---- SISTEMA NO COMPATIBLE CON EL ADM ---"
echo -e " "
echo -e "  UTILIZA LAS VARIANTES MENCIONADAS DENTRO DEL MENU "
echo ""
echo -e "		[ ! ]  Power by @ChumoGH  [ ! ]"
echo ""
msg -bar3
exit && exit
}
echo -e "\e[1;31m  SISTEMA:  \e[33m$distro $vercion \e[1;31m	CPU:  \e[33m$(lscpu | grep "Vendor ID" | awk '{print $3}')" 
msg -bar3
dpkg --configure -a > /dev/null 2>&1 && echo -e "\033[94m    ${TTcent} INTENTANDO RECONFIGURAR UPDATER ${TTcent}" | pv -qL 80
msg -bar3
echo -e "\033[94m    ${TTcent} UPDATE DATE : $(date +"%d/%m/%Y") & TIME : $(date +"%H:%M") ${TTcent}" | pv -qL 80
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] || apt-get install net-tools -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "boxes"|head -1) ]] || apt-get install boxes -y &>/dev/null
echo ""
apt-get install software-properties-common -y > /dev/null 2>&1 && echo -e "\033[94m    ${TTcent} INSTALANDO NUEVO PAQUETES ( S|P|C )    ${TTcent}" | pv -qL 80
sysctl -w net.ipv6.conf.all.disable_ipv6=1 &> /dev/null
sysctl -w net.ipv6.conf.default.disable_ipv6=1 &> /dev/null
echo ""
echo -e "\033[94m    ${TTcent} PREPARANDO BASE RAPIDA INSTALL    ${TTcent}" | pv -qL 80 
msg -bar3
echo " "
#[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y -qq --silent &>/dev/null
clear&&clear
rm $(pwd)/$0 &> /dev/null 
return
}
clear&&clear
update_pak
clear&&clear
rutaSCRIPT ${distro} ${vercion}
rm -f instala.* lista*
echo -e " TIEMPO DE EJECUCION $((($(date +%s)-$TIME_START)/60)) min."
[[ -z $_TIME_START ]] || {
while true; do
read -p " ENTER PARA IR AL MENU"
[[ "$((($(date +%s)-$_TIME_START)/60))" -ge "2" ]] && break
sleep 0.5s
echo -e " TIEMPO DE INSTALACION $((($(date +%s)-$_TIME_START)/60)) min."
tput cuu1 && tput dl1
tput cuu1 && tput dl1
done
}
#chekKEY

[[ -e "$(which cgh)" ]] && $(which cgh) || echo -e " INSTALACION NO COMPLETADA CON EXITO !"
} || {
echo -e " NO SE RECIVIO PARAMETROS "
rm -f setup.sh*
rm -f /etc/folteto
}