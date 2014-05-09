#!/system/bin/sh
# vPnfi v.0.3 - tiny openvpn to wifi tethering script ! 
#  ----------------------------------------------------
#   Script Tested on aokp jb mr 1 milestone 1 for d2vzw
#    +openvpn for android 0.6.13 @ http://plai.de/android/ics-openvpn-0.6.13-with-openssl.apk
#    +aokp jb mr 1 milestone 1 @ aokp.co
#    +private openvpn install with push "redirect-gateway autolocal def1"  on ubuntu 12.04 32bit
#    +smwidgets and scriptmanager from playstore.
#   Progenitor: See original thread on xda @ http://is.gd/IdztB2 thanks to scootley
#    +Final: love_decay , love_decay@hotmail.com , http://github.com/love-decay
#   wifi tested on iOS 7, Android 4.2, Win7 (Atheros Wifi Card) , Amazon Kindle, Blackberry 9900, Playstation 3
#   see vPnfi-flush.sh
#   v.0.2 - added client lease
#   v.0.3 - added dns forward to openvpn
#   If you get “bash: precmd: not found”, do
#   unset PS1 PROMPT_COMMAND (if you use bash not ash)
#   iptables -A FORWARD -i wlan0 -p 17 -o tun0 -j ACCEPT ; sleep 5
#Steps 
#  1- Connect your vpn and start your wifi tether ( i use stock wifi tether that comes with my ROM ).
#
#  2- You need to find your wlan0 ip . on android device's terminal execute netcfg and note the value for
#     wlan0 on my sgs3(d2vzw) its 192.168.43.1/24 . Find yours and write it down.
#
#  3- Run vPnfi-flush.sh to flush iptables 
#     NOTE: Turn of any firewall or antivirus (dispensable on *nix)
#   
#  4- Execute command: ' ip rule ' in terminal and note number for ...lookup local, mine is 0
#    
#  5- Modify values in 2 & 4 appropriately . Switch dns to 8.8.8.8 or 208.67.222.222
#
#
iptables -t filter -F FORWARD ; sleep 1
iptables -t nat -F POSTROUTING ; sleep 1
iptables -t filter -I FORWARD -j ACCEPT ; sleep 1
iptables -t nat -I POSTROUTING -j MASQUERADE ; sleep 1
ip rule add from 192.168.43.0/24 lookup 0 ; sleep 1

