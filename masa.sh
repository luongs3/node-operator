# tut: https://github.com/masa-finance/masa-node-v1.0
# gc luongnp5 vm subspace

git clone https://github.com/masa-finance/masa-node-v1.0
cd masa-node-v1.0
PRIVATE_CONFIG=ignore docker-compose up -d

docker exec -it masa-node-v10_masa-node_1 /bin/sh
geth attach /qdata/dd/geth.ipc
>admin.nodeInfo
>admin.addPeer("enode://dd0f403e18b3ed567ed4cd12cf0db9e4e99dd5aa33d97b36edf56fd538dc5668632f2e3ce91a7795d0f367e767aa488147276de411756ee9f60ab54514a8d011@193.17.92.71:30300")
>net.peerCount
>eth.blockNumber
>admin.peers