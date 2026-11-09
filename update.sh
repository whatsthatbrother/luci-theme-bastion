#!/bin/sh
# Run on the router. Downloads the current theme files from GitHub.
set -e
BASE=https://raw.githubusercontent.com/whatsthatbrother/luci-theme-bastion/main/root
TMP=$(mktemp -d)
FILES="www/luci-static/bastion/bastion.css
www/luci-static/bastion/logo.svg
www/luci-static/resources/menu-bastion.js
usr/share/ucode/luci/template/themes/bastion/header.ut
usr/share/ucode/luci/template/themes/bastion/footer.ut
usr/share/ucode/luci/template/themes/bastion/sysauth.ut"
for f in $FILES; do
	mkdir -p "$TMP/$(dirname "$f")"
	wget -qO "$TMP/$f" "$BASE/$f"
	[ -s "$TMP/$f" ] || { echo "Download failed: $f"; rm -rf "$TMP"; exit 1; }
done
for f in $FILES; do
	mkdir -p "/$(dirname "$f")"
	cp "$TMP/$f" "/$f"
done
rm -rf "$TMP"
echo "Bastion updated. Reload LuCI with Ctrl+F5."
