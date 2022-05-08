## General Information

A SOCKS5 service that you can run on your boxes, if for some reason SSH doesn't cut it for you.

It's very lightweight, and very light on resources too.

## Installation

Compile socksd and put the binary in `/usr/bin`:

```bash
make install
```

If you wish to install socksd as a systemd service, please do the following:

```bash
cp deb/DEBIAN/socksd.systemd.service /usr/lib/systemd/system/socksd.service
chmod +x /usr/lib/systemd/system/socksd.service
systemctl daemon-reload
systemctl start socksd
```

After starting socksd as a service, the proxy becomes available at 0.0.0.0:1337.

## Usage

Bind the proxy to the specified address:

```bash
socksd -i 10.10.10.100 -p 4200
```