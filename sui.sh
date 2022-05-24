# Situation: devnet
# Tut: https://docs.sui.io/explore/devnet?utm_source=medium&utm_medium=social&utm_campaign=devnet
# Wallet: https://docs.sui.io/build/wallet
# Sui: https://docs.sui.io/build/install#binaries
# Cargo: Rust's package management https://doc.rust-lang.org/cargo/getting-started/installation.html
# vps: luongnp5 instance-2
# install cargo
curl https://sh.rustup.rs -sSf | sh
# install sui
sudo apt install build-essential
sudo apt install clang
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch "devnet" sui
echo $PATH | grep cargo
```
{
  "accounts": [
    "1560eaeb640f3197357e0e0bbcc0dd82fc390cf1"
  ],
  "keystore": {
    "File": "/home/luongnp5_gmail_com/.sui/sui_config/wallet.key"
  },
  "gateway": {
    "rpc": "https://gateway.devnet.sui.io:9000"
  },
  "active_address": "1560eaeb640f3197357e0e0bbcc0dd82fc390cf1"
}
```
sui genesis -f (run local testnet)
```
2022-05-09T08:37:08.214010Z  INFO sui::sui_commands: Network config file is stored in "/home/luongnp5_gmail_com/.sui/sui_config/network.conf".
2022-05-09T08:37:08.214076Z  INFO sui::sui_commands: Wallet keystore is stored in "/home/luongnp5_gmail_com/.sui/sui_config/wallet.key".
2022-05-09T08:37:08.214233Z  INFO sui::sui_commands: Gateway config file is stored in "/home/luongnp5_gmail_com/.sui/sui_config/gateway.conf".
2022-05-09T08:37:08.214360Z  INFO sui::sui_commands: Wallet config file is stored in "/home/luongnp5_gmail_com/.sui/sui_config/wallet.conf".
```
