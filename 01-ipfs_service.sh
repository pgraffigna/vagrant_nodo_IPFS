#!/bin/bash

DIR=/home/vagrant

sudo apt install -y policykit-1
mkdir "$DIR"/ipfs/

export IPFS_PATH="$DIR"/ipfs/

sudo tee -a /etc/systemd/system/ipfs.service << EOF
[Unit]
Description=IPFS daemon
After=network.target

[Service]
User=vagrant
Type=simple
Restart=on-failure
Environment=IPFS_PATH=$DIR/ipfs/
WorkingDirectory=$DIR/ipfs
ExecStart=/usr/local/bin/ipfs daemon

[Install]
WantedBy=multiuser.target
EOF

sudo systemctl enable ipfs --now
systemctl status ipfs.service

ipfs daemon

# Acceso a Dashboard desde cliente - local-portforwarding
# ssh -f -T -N -L 5001:127.0.0.1:5001 -l vagrant 192.168.60.10

# Cerrar la conexión SSH en background 
# ps -C ssh | grep -A1 ssh | awk '{print $1}' | xargs kill