# Docs: https://docs.subspace.network/protocol/farm/farming/#-getting-started-farming
# vps: gc luongnp5 subspace
wget https://github.com/subspace/subspace/releases/download/gemini-1b-2022-june-05/subspace-farmer-ubuntu-x86_64-gemini-1b-2022-june-05
wget https://github.com/subspace/subspace/releases/download/gemini-1b-2022-june-05/subspace-node-ubuntu-x86_64-gemini-1b-2022-june-05

sudo chmod +x subspace-*

nohup ./subspace-node-ubuntu-x86_64-gemini-1b-2022-june-05 \
  --chain gemini-1 \
  --execution wasm \
  --pruning 1024 \
  --keep-blocks 1024 \
  --validator \
  --name cgnguyen  > node.log &


# check log 
tail -f node.log

# Then wait until your node is fully synchronized.
# Check sync at: https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Fna.gemini-1b.subspace.network%2Fws#/explorer

# Replace `WALLET_ADDRESS` below with your account address from Polkadot.js wallet (Step II.3)
nohup ./subspace-farmer-ubuntu-x86_64-gemini-1b-2022-june-05 farm --reward-address 5H97wT9PQjYeZ2HSUtcHhQrWU2dgNqU4PXWnYyoKhxN1WFqk --plot-size 40G  > farm.log &

# View log file
tail -f farm.log

# Check farmed reward: https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Ffarm-rpc.subspace.network#/accounts

# turn off
ps -ef | grep subspace
kill -9 <<PID>>

# wipe
./subspace-farmer-ubuntu-x86_64-gemini-1b-2022-june-05 wipe
./subspace-node-ubuntu-x86_64-gemini-1b-2022-june-05 purge-chain --chain gemini-1
