# tut 1: https://aptos.dev/tutorials/run-a-fullnode
# tut 2 :(google cloud): https://aptos.dev/tutorials/run-a-fullnode-on-gcp
# vps: luongnp5 vm instance-2

# Incentive testnet
# Info: https://medium.com/aptoslabs/aptos-incentivized-testnet-roadmap-209be695c77c
# Register: https://medium.com/aptoslabs/launch-of-aptos-incentivized-testnet-registration-2e85696a62d0
# Tut: https://aptos.dev/tutorials/validator-node/run-validator-node-using-docker

# 1. Install Docker and Docker-Compose, Aptos CLI. (https://github.com/aptos-labs/aptos-core/blob/main/crates/aptos/README.md)
# 2. Create a directory for your Aptos node composition
export WORKSPACE=aptos-testnet
mkdir ~/$WORKSPACE
cd ~/$WORKSPACE
# 3. Download the validator.yaml, fullnode.yaml and docker-compose.yaml configuration files into this directory.
wget https://raw.githubusercontent.com/aptos-labs/aptos-core/main/docker/compose/aptos-node/docker-compose.yaml
wget https://raw.githubusercontent.com/aptos-labs/aptos-core/main/docker/compose/aptos-node/validator.yaml
wget https://raw.githubusercontent.com/aptos-labs/aptos-core/main/docker/compose/aptos-node/fullnode.yaml
# 4. Generate key pairs (node owner key, consensus key and networking key) in your working directory.
aptos genesis generate-keys --output-dir ~/$WORKSPACE
```
{
  "Result": [
    "/home/luongnp5_gmail_com/aptos-testnet/private-keys.yaml",
    "/home/luongnp5_gmail_com/aptos-testnet/validator-identity.yaml",
    "/home/luongnp5_gmail_com/aptos-testnet/validator-full-node-identity.yaml"
  ]
}
```
# 5. Configure validator information
aptos genesis set-validator-configuration \
    --keys-dir ~/$WORKSPACE --local-repository-dir ~/$WORKSPACE \
    --username cgnguyenbot \
    --validator-host 34.125.78.252:6180 \
    --full-node-host 34.125.78.252:6182
# 6. Create layout YAML file
vi layout.yaml
```
---
root_key: "0x5243ca72b0766d9e9cbf2debf6153443b01a1e0e6d086c7ea206eaf6f8043956"
users:
  - cgnguyenbot
chain_id: 23
```
# 7. Download AptosFramework Move bytecodes.
wget https://github.com/aptos-labs/aptos-core/releases/download/aptos-framework-v0.1.0/framework.zip
unzip framework.zip
# 8. Compile genesis blob and waypoint
aptos genesis generate-genesis --local-repository-dir ~/$WORKSPACE --output-dir ~/$WORKSPACE
# 9. Run
docker-compose up -d

# Check success: https://aptos-node.info/  34.125.78.252