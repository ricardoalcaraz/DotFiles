ufw default deny
ufw allow from 192.168.1.0/24
ufw allow from 63.205.195.240/28
ufw allow Deluge
ufw limit ssh
ufw logging off