#Tut: https://mzonder.notion.site/ARCHWAY-GENTX-submition-torii-1-787e7a7d7f9c40808c6eaddca01b7b2c
# clone repo
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bashrc

git clone https://github.com/archway-network/archway
cd archway
git checkout main
make install

archwayd version
# "0.0.5"

cd $HOME

# set vars
ARCHWAY_CHAIN="torii-1"
ARCHWAY_MONIKER="cgnguyen-val" # come up with your validator name
ARCHWAY_WALLET="cgnguyen" 

echo 'export ARCHWAY_CHAIN='${ARCHWAY_CHAIN} >> $HOME/.bashrc
echo 'export ARCHWAY_MONIKER='${ARCHWAY_MONIKER} >> $HOME/.bashrc
echo 'export ARCHWAY_WALLET='${ARCHWAY_WALLET} >> $HOME/.bashrc
source $HOME/.bashrc

# init
archwayd init ${ARCHWAY_MONIKER} --chain-id $ARCHWAY_CHAIN

# create keys
archwayd keys add $ARCHWAY_WALLET


# SAVE MNEMONIC FROM OUTPUT NOW!


# CREATE GENTX 

# get penultimate_genesis 
wget -O $HOME/.archway/config/genesis.json "https://raw.githubusercontent.com/archway-network/testnets/main/torii-1/penultimate_genesis.json"


# add gen acc
archwayd add-genesis-account $(archwayd keys show $ARCHWAY_WALLET -a) 1001000utorii


# create gentx (set any commission and delegation amount you want)

archwayd gentx $ARCHWAY_WALLET 1000000utorii \
  --commission-rate=0.1 \
  --commission-max-rate=0.1 \
  --commission-max-change-rate=0.1 \
  --pubkey $(archwayd tendermint show-validator) \
  --chain-id=torii-1 \
  --moniker="${ARCHWAY_MONIKER}"

# OUTPUT EXAMPLE
# Genesis transaction written to "/home/luongnp5_gmail_com/.archway/config/gentx/gentx-9053a5adb331c3cf5057f18891512bdb0f7aadd1.json"

DOWNLOAD AND BACKUP $HOME/.archway/config/priv_validator_key.json NOW!



# Push PR manually ==========================================================

# Create Pull Request to this repository -
# https://github.com/archway-network/testnets/tree/main/torii-1/gentx
# 1. create file with name gentx-7fba3a5XXXXXXXXXXXXXXXXXXXxxxxXXXXXXX1.json
# 2. submit PR
# ===========================================================================

git clone git@github.com:archway-network/testnets.git
mkdir -p testnets/torii-1/gentx/
cp $HOMEDIR/config/gentx/*.json testnets/torii-1/gentx/

# https://github.com/archway-network/testnet-signer
git clone https://github.com/archway-network/testnet-signer.git
cd testnet-signer
make install
testnet-signer sign_id wallet_name

# Archway: smart contract platform on Cosmos, raised $21M by CoinFund & Hashed
# - tut 1: https://docs.archway.io/docs/validator/overview/
# - tut 2: https://nodes.migoi.io/en/latest/archway.html
# - tut 3 (incentive testnet): https://philabs.notion.site/Validator-Setup-Guide-10502472842e4ad8bf7fb7ec68afe07a
# - Rewards: https://philabs.notion.site/Challenges-d496563804714776b7c361493f41f5d9
# - vps: luongnp5 gc instance-1
# - Validator name: cgnguyen-val
# - wallet: cgnguyen
# - pass phrase: cgnguyen
# - name: cgnguyen
# - type: local
# - address: archway1tdxv977wqtne0yj8kn23k3zpu66npnw9jms38d
# - pubkey: '{"@type":"/cosmos.crypto.secp256k1.PubKey","key":"A2nV4CkPbpLeedkiKiOXNJagGsC7lRiTCm42pN1kNHJR"}'
# -   mnemonic: "comfort evidence method grocery state warm noble word budget bind become maze glimpse ceiling cram remove doctor stock please similar pioneer echo echo purchase"