# stops/starts the appropriate services

# TODO: create a list of stop/start services and have Perl script
# actually go through them or something

systemctl stop avahi-daemon avahi-daemon.socket wpa_supplicant cups
systemctl stop irqbalance tuned vboxadd

systemctl disable avahi-daemon avahi-daemon.socket wpa_supplicant cups
systemctl disable irqbalance tuned vboxadd




systemctl enable dnsmasq postgresql mariadb
systemctl start dnsmasq postgresql mariadb


