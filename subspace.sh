wget https://github.com/subspace/subspace/releases/download/snapshot-2022-mar-09/subspace-node-ubuntu-x86_64-snapshot-2022-mar-09
wget https://github.com/subspace/subspace/releases/download/snapshot-2022-mar-09/subspace-farmer-ubuntu-x86_64-snapshot-2022-mar-09

sudo chmod +x subspace-*

nohup ./subspace-node-ubuntu-x86_64-snapshot-2022-mar-09 \
  --chain testnet \
  --wasm-execution compiled \
  --execution wasm \
  --bootnodes "/dns/farm-rpc.subspace.network/tcp/30333/p2p/12D3KooWPjMZuSYj35ehced2MTJFf95upwpHKgKUrFRfHwohzJXr" \
  --rpc-cors all \
  --rpc-methods unsafe \
  --ws-external \
  --validator \
  --telemetry-url "wss://telemetry.polkadot.io/submit/ 1" \
  --telemetry-url "wss://telemetry.subspace.network/submit 1" \
  --name cgnguyen  > node.log &

# check log 
tail -f node.log

# Then wait until your node is fully synchronized.
# Check sync at: https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Ffarm-rpc.subspace.network#/explorer

# Replace `WALLET_ADDRESS` below with your account address from Polkadot.js wallet (Step II.3)
nohup ./subspace-farmer-ubuntu-x86_64-snapshot-2022-mar-09 farm --reward-address 5H97wT9PQjYeZ2HSUtcHhQrWU2dgNqU4PXWnYyoKhxN1WFqk  > farm.log &

# View log file
tail -f farm.log

# Check farmed reward: https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Ffarm-rpc.subspace.network#/accounts
