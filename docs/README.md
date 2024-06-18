# System maintenance

```bash
pacreport --unowned-files
```
The following files not owned by a package but should be

  /etc/systemd/system/docker-compose@.service
  /etc/systemd/system/storage-surveillance.mount
  /etc/tmpfiles.d/10-looking-glass.conf
  /opt/Pacman.NET.Mirror/
  /opt/scrypted/
  /srv/http/reverse-proxy/
  /storage/
  /etc/modprobe.d/disable-overlay-redirect-dir.conf
  
The following files need to be backed up in some way
  /etc/letsencrypt/
  /etc/iwd/
  /etc/libvirt/qemu/win10.xml
  /etc/samba/credentials/
  /etc/docker/


## Meeshti

Following unowned files
  /etc/systemd/network/20-wlan.network
  /etc/systemd/network/20-wwan.network
  /etc/systemd/network/25-mv-0.netdev
  /etc/systemd/network/30-eno1.network
  /etc/systemd/network/35-mv-0.network
  /etc/systemd/network/40-ethernet.network
  /etc/systemd/nspawn/
  /etc/systemd/resolved.conf.d/
  /etc/samba/credentials/
  /etc/systemd/system/storage-media.mount