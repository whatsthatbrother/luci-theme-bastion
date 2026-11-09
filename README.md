# luci-theme-bastion

A LuCI theme for OpenWrt with a dark left sidebar, a white top bar and
card-style sections. It is a thin layer on top of the stock
`luci-theme-bootstrap`: Bootstrap's stylesheet is loaded first and
`bastion.css` restyles it.

Developed against OpenWrt 25.12 (Cudy WR3000 v1). Early version: installed and working on that router; the login page has not been checked yet.

## Requirements

- OpenWrt 25.12 with LuCI (ucode templates)
- `luci-theme-bootstrap` installed (it is by default) - do not remove it

## Install

On your computer:

```
git clone https://github.com/whatsthatbrother/luci-theme-bastion.git
scp -O -r luci-theme-bastion root@<router-ip>:/tmp/
ssh root@<router-ip> "sh /tmp/luci-theme-bastion/install.sh"
```

Reload LuCI with Ctrl+F5. Nothing is restarted.

## Update

After the first install, pull the latest files straight from GitHub on the router:

```
ssh root@<router-ip> "wget -qO- https://raw.githubusercontent.com/whatsthatbrother/luci-theme-bastion/main/update.sh | sh"
```

## Switch back / uninstall

Pick another theme under System > System > Language and Style, or:

```
ssh root@<router-ip> "sh /tmp/luci-theme-bastion/uninstall.sh"
```

## Notes

- The sidebar layout applies from 768 px width. Below that the stock
  Bootstrap top menu is used, with Bastion colours.
- The theme is not kept across a firmware upgrade; install it again afterwards.

## Files

| Path | Purpose |
|---|---|
| `root/www/luci-static/bastion/bastion.css` | Theme stylesheet |
| `root/www/luci-static/resources/menu-bastion.js` | Menu renderer (marks the active page) |
| `root/usr/share/ucode/luci/template/themes/bastion/` | Header, footer and login templates |

## License

Apache License 2.0. The templates and menu script are modified from
[luci-theme-bootstrap](https://github.com/openwrt/luci/tree/master/themes/luci-theme-bootstrap),
copyright its authors (Steven Barth, David Menting, Jo-Philipp Wich and contributors).
