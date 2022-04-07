# Setup required variables
echo 'export NODENAME='\"cgnguyen\" >> $HOME/.bashrc
echo 'export NETWORK_NAME='\"augusta\" >> $HOME/.bashrc
echo 'export MY_VALIDATOR_ACCOUNT='\"acc-cgnguyen\" >> $HOME/.bashrc
echo 'export WALLET='\"cgnguyen\" >> $HOME/.bashrc
echo 'export CHAIN_ID='\"augusta-1\" >> $HOME/.bashrc
echo 'export MONIKER='\"archway-s0-idc\" >> $HOME/.bashrc
source ~/.bashrc

# node syncing
sudo rm -rf ~/.archway
docker run --rm -it -v ~/.archway:/root/.archway archwaynetwork/archwayd:$NETWORK_NAME \
  init acc-cgnguyen --chain-id $CHAIN_ID
archwayd keys add acc-cgnguyen
sudo chmod -R 777 ~/.archway/config/
perl -i -pe 's/^minimum-gas-prices = .+?$/minimum-gas-prices = "0august"/' $HOME/.archway/config/app.toml
# setting up peers
export SEEDS="2f234549828b18cf5e991cc884707eb65e503bb2@34.74.129.75:31076"
sed -i.bak -e "s/^seeds *=.*/seeds = \"$SEEDS\"/" ~/.archway/config/config.toml
sed -i.bak -e "s/prometheus = false/prometheus = true/" ~/.archway/config/config.toml
export RPC_URL="https://rpc.augusta-1.archway.tech"
curl -s "https://nodes.migoi.io/en/latest/_static/archway/archway_genesis.json" | jq '.result.genesis' > ~/.archway/config/genesis.json
docker run -d -it -p 1317:1317 -p 26656:26656 -p 26657:26657 \
                    --name $NODENAME \
                    -v ~/.archway:/root/.archway archwaynetwork/archwayd:augusta \
                    start \
                    --x-crisis-skip-assert-invariants

# create validator
docker exec -it cgnguyen \
  archwayd tx staking create-validator \
  --amount 100000000uaugust \
  --from cgnguyen \
  -s 1 \
  --commission-max-change-rate "0.01" \
  --commission-max-rate "0.20" \
  --commission-rate "0.01" \
  --min-self-delegation "1" \
  --pubkey `docker exec -it cgnguyen archwayd tendermint show-validator` \
  --moniker "acc-cgnguyen" \
  --chain-id $CHAIN_ID \
  --gas auto \
  --fees 1uaugust




# Cleanup: Remove old genesis.json if existed
rm -f ~/.archway/config/genesis.json
docker rm -f archway 2&>/dev/null

# Run docker image augusta
docker run --rm -it -v $HOME/.archway:/root/.archway archwaynetwork/archwayd:augusta init $NODENAME --chain-id $CHAIN_ID
docker run --rm -it -v $HOME/.archway:/root/.archway archwaynetwork/archwayd:augusta config chain-id $CHAIN_ID

# Configure required variables
perl -i -pe 's/^minimum-gas-prices = .+?$/minimum-gas-prices = "0august"/' $HOME/.archway/config/app.toml
SEEDS="2f234549828b18cf5e991cc884707eb65e503bb2@34.74.129.75:31076,c8890bcde31c2959a8aeda172189ec717fef0b2b@95.216.197.14:26656"
PEERS="332dea7332a0c4647a147a08bf50bb2038931e4c@81.30.158.46:26656,4e08eb9d62607d05e3fa3fa52d98a00014c8040b@162.55.90.254:26656,4a701d399a0cd4a577e5b30c9d3cc5d75854936e@95.214.53.132:26456,0c019ac4e4f39d95355926435e50a25ed589915f@89.163.151.226:26656,b65efc14137a426a795b5e78cf34def7e5240231@89.163.164.211:26656,33baa872768e12d4100bce5eb875b90b8739a1d4@185.214.134.154:46656,76862fd5ee017b7b46f65a7ac15da12bba12f7f1@49.12.215.72:26656"
sed -i.bak -e "s/^seeds *=.*/seeds = \"$SEEDS\"/; s/^persistent_peers *=.*/persistent_peers = \"$PEERS\"/" $HOME/.archway/config/config.toml
sed -i.bak -e "s/prometheus = false/prometheus = true/" $HOME/.archway/config/config.toml
curl -s "https://nodes.migoi.io/en/latest/_static/archway/archway_genesis.json" | jq '.result.genesis' > ~/.archway/config/genesis.json

docker run --rm -it -v $HOME/.archway:/root/.archway archwaynetwork/archwayd:augusta unsafe-reset-all
wget -O addrbook.json https://nodes.migoi.io/en/latest/_static/archway/addrbook_archway.json
mv addrbook.json $HOME/.archway/config/
docker run --restart=always -d -it --network host --name archway -v $HOME/.archway:/root/.archway archwaynetwork/archwayd:augusta start --x-crisis-skip-assert-invariants

echo "alias archwayd='docker exec -it archway archwayd'" >> $HOME/.bashrc
source ~/.bashrc
