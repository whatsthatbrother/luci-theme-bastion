#!/bin/sh
# Run on the router. Switches back to Bootstrap and removes Bastion.
uci -q delete luci.themes.Bastion
uci set luci.main.mediaurlbase=/luci-static/bootstrap
uci commit luci
rm -rf /www/luci-static/bastion /www/luci-static/resources/menu-bastion.js \
       /usr/share/ucode/luci/template/themes/bastion
echo "Bastion removed."
