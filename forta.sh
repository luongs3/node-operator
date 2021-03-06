# announcemen: https://forta.org/blog/announcing-fortification/
# Dashboard: https://forta.notion.site/Forta-Fortification-Network-4a8af3ab4aea480d993e5095ad0ed746
# Phase 1: Fortification
# vps: luongnp5 vm subspace + instance-2
# 1. Install and Configure Docker
# Install Docker (at least v20.10)
# Add a file called daemon.json to your /etc/docker directory with the following contents:
cd /etc/docker
sudo touch daemon.json
sudo nano daemon.json
```
{
   "default-address-pools": [
        {
            "base":"172.17.0.0/12",
            "size":16
        },
        {
            "base":"192.168.0.0/16",
            "size":20
        },
        {
            "base":"10.99.0.0/16",
            "size":24
        }
    ]
}
```
sudo systemctl restart docker

# 2. Install Forta
sudo curl https://dist.forta.network/pgp.public -o /usr/share/keyrings/forta-keyring.asc -s
echo 'deb [signed-by=/usr/share/keyrings/forta-keyring.asc] https://dist.forta.network/repositories/apt stable main' | sudo tee -a /etc/apt/sources.list.d/forta.list
sudo apt-get update
sudo apt-get install forta

# 3. Initial Setup
forta init --passphrase cgnguyen
# Scanner address: 0x2a6AD798acb2a9b718a5b28071D26335F4702382 (subspace)
# Scanner address: 0x876ae6A8F4eC2BF3fF2dE24D975A814e3648343f (instance-2)
# Successfully initialized at /home/digibase_tnv_edu_vn/.forta
- Send some matic to 0x2a6AD798acb2a9b718a5b28071D26335F4702382
cd /etc/systemd/system
sudo mkdir forta.service.d
cd forta.service.d
sudo touch env.conf
sudo nano /etc/systemd/system/forta.service.d/env.conf
[Service]
Environment="FORTA_DIR=/home/digibase_tnv_edu_vn/.forta"
Environment="FORTA_PASSPHRASE=cgnguyen"

# setup config.yml
# Get KEY from https://dashboard.alchemyapi.io/ => Forta
```
chainId: 137

# The scan settings are used to retrieve the transactions that are analyzed
scan:
  jsonRpc:
    url: https://polygon-mainnet.g.alchemy.com/v2/xqJVBFvg7hgCEDHIJu9HMxs9tLV9J6hC

trace:
  jsonRpc:
    url: https://polygon-mainnet.g.alchemy.com/v2/xqJVBFvg7hgCEDHIJu9HMxs9tLV9J6hC

# The proxy settings are used for detection bots to make their own json-rpc calls.
# By default, this is set to the scan node url value. We recommend setting
# this differently than the scan node url value if you are using a paid plan.
#jsonRpcProxy:
#  jsonRpc:
#    url: http://different-api:8545
```

forta register --owner-address 0x91878ec5288E944fD4A357022d60DbE9Ab49c46f --passphrase cgnguyen
# (instance-2) forta register --owner-address 0x91878ec5288E944fD4A357022d60DbE9Ab49c46f --passphrase cgnguyen

sudo systemctl daemon-reload
sudo systemctl enable forta
sudo systemctl start forta
sudo systemctl status forta
# sudo journalctl -f -u forta
# sudo systemctl stop forta
forta status

# Moniter:
- https://explorer.forta.network/network
- SLA: https://docs.forta.network/en/latest/sla-api/
- Check SLA online: http://alt.pp.ua/forta/
- GET https://api.forta.network/stats/sla/scanner/0x2a6AD798acb2a9b718a5b28071D26335F4702382
- Check SLA with curl: curl -s https://api.forta.network/stats/sla/scanner/0x2a6AD798acb2a9b718a5b28071D26335F4702382 | jq | head


# add 1 more node (instance-2)
# Tut: https://docs.forta.network/en/latest/stake-on-scan-node/#depositing-stake
0x876ae6A8F4eC2BF3fF2dE24D975A814e3648343f