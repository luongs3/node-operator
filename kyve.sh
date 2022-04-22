# tut: https://medium.com/@bitdealer91/how-to-run-a-node-in-kyve-c4c12b0b43ac
# Git: https://github.com/KYVENetwork/chain
- install keplr wallet
- install arweave wallet
- receive test token

sudo apt update && apt install unzip
mkdir -p /home/luongnp5_gmail_com/kyve
cd /home/kyve && wget https://github.com/KYVENetwork/evm/releases/download/v1.0.3/evm-linux.zip && unzip evm-linux.zip

sudo tee /etc/systemd/system/kyved.service > /dev/null <<EOF
[Unit]
Description=Kyve Node
After=network-online.target
[Service]
User=root
WorkingDirectory=/home/luongnp5_gmail_com/kyve/
ExecStart=/home/luongnp5_gmail_com/kyve/evm-linux -m "tribe surround rally foot distance measure hybrid fancy wool amount nothing coconut" -k /home/luongnp5_gmail_com/kyve/arweave.json -p 1 -v -s 2000
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable kyved
sudo systemctl start kyved
# View logs
journalctl -f -u kyved
