#!/bin/sh
# Run on the router, from the extracted repository directory.
set -e
cd "$(dirname "$0")"
cp -r root/www root/usr /
uci set luci.themes.Bastion=/luci-static/bastion
uci set luci.main.mediaurlbase=/luci-static/bastion
uci commit luci
echo "Bastion installed. Reload LuCI with Ctrl+F5."
