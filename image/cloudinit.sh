users:
  - name: root
    ssh_authorized_keys:
      - ssh-ed25519 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      - ssh-ed25519 YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY

write-files:
- content: |
    [Security]
    PreSharedKey=efb8c558577d15bbcbe33b3fcb5f6df226d1d6e1e366bb3cce9fbeff94b791f9
  path:/var/lib/iwd/ATTX9XhM83.psk
runcmd:
- systemctl restart iwd.service