# tut: https://medium.com/@bitdealer91/how-to-run-a-node-in-kyve-c4c12b0b43ac
# Git: https://github.com/KYVENetwork/chain
# vps: luongnp5 vm subspace
# wallet kelp: kyve1z2543n6wf9ef7wvga8ftl45dpf3z95hmv93p9x
# wallet arweave: OvJ1D-ByI_UU6o5k6HrrBuDzgRGQ6IG_5Och44Ikchg
- install keplr wallet
- install arweave wallet
- receive test token

sudo apt update && apt install unzip
mkdir -p /home/luongnp5_gmail_com/kyve
cd /home/luongnp5_gmail_com/kyve
wget https://github.com/kyve-org/cosmos/releases/download/v0.0.0/kyve-cosmos-linux.zip
unzip kyve-cosmos-linux.zip

sudo tee /etc/systemd/system/kyved.service > /dev/null <<EOF
[Unit]
Description=Kyve Node
After=network-online.target
[Service]
User=root
WorkingDirectory=/home/luongnp5_gmail_com/kyve/
ExecStart=/home/luongnp5_gmail_com/kyve/kyve-cosmos-linux -m "tribe surround rally foot distance measure hybrid fancy wool amount nothing coconut" -k /home/luongnp5_gmail_com/kyve/arweave.json -p 11 -v -s 2400
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

# ./kyve-cosmos-linux -m "tribe surround rally foot distance measure hybrid fancy wool amount nothing coconut" -k /home/luongnp5_gmail_com/kyve/arweave.json -p 10 -v -s 2400

sudo systemctl daemon-reload
sudo systemctl enable kyved
sudo systemctl start kyved
# sudo systemctl stop kyved
# View logs
# However, this only works if the Storage directive of the [Journal] section of
# /etc/systemd/journald.conf is set to persistent
sudo systemctl status -l kyved
sudo journalctl -f -u kyved


# ---- Kyve Korellia ----
# Detail: https://blog.kyve.network/kyve-launches-incentivized-testnet-mission-korellia-d53280a17c6d
# Register: https://app.kyve.network/#/
