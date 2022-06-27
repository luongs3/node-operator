# Incentive testnet: https://developers.masa.finance/docs/incentivized-testnet
# email: luongr3@gmail.com
# phase1 enode: enode://e3aa7aa16ca9d6d3c8550aeb074b0dbdbd64f5269a715e006bdb4a6f712427806d93225bfb90613d5f0f17e0642940998a0b2d834bd0d3026663ae539a5d7314@34.125.151.162:21000
# tut: https://github.com/masa-finance/masa-node-v1.0
# gc luongnp5 vm instance-2

git clone https://github.com/masa-finance/masa-node-v1.0
cd masa-node-v1.0
PRIVATE_CONFIG=ignore docker-compose up -d

docker exec -it masa-node-v10_masa-node_1 /bin/sh
geth attach /qdata/dd/geth.ipc
admin.nodeInfo
# vm: subspace (34.125.151.162)
#  enode: "enode://e3aa7aa16ca9d6d3c8550aeb074b0dbdbd64f5269a715e006bdb4a6f712427806d93225bfb90613d5f0f17e0642940998a0b2d834bd0d3026663ae539a5d7314@127.0.0.1:21000",
#  enr: "enr:-J24QJKmXBKoNwv-we0c9xJ8SpvIMKTdtsSIx2UIzAG0Em6VJsTZbPHhfbqcK7yCYorB17wy7ZkMJ7wt-P2bd2mDNOEDg2V0aMfGhHxO0qmAgmlkgnY0gmlwhH8AAAGJc2VjcDI1NmsxoQLjqnqhbKnW08hVCusHSw29vWT1JppxXgBr20pvcSQngIRzbmFwwIN0Y3CCUgiDdWRwglII",
#  id: "94217ee7f6171086ce435730e66706390abe364296d9771fd2abe3af7aa8341f",

# vm: instance-2 (34.125.78.252), email: luongr3@gmail.com, phrase 2
#  enode: "enode://bff6a1b01d63996155850f5be166d8dd1f2b0223146495473186d9f12fc8460ecf761379ebf6e9384e4db392379733244937203290321d7f329ca9f91ad88c3d@127.0.0.1:21000",
#  enr: "enr:-J24QL0NQo0cJPsBCXRRFJ5z0ZRc5ZwimKGioevKjdqh56F4Wn2H301X0MS8UhZ29tkgyM7yYEw4o-n7ejNgT9LRN-sBg2V0aMfGhHxO0qmAgmlkgnY0gmlwhH8AAAGJc2VjcDI1NmsxoQO_9qGwHWOZYVWFD1vhZtjdHysCIxRklUcxhtnxL8hGDoRzbmFwwIN0Y3CCUgiDdWRwglII",
#  id: "225ed401662dae6818e0808395bff7107820ef570c7e32435eb27b6932a30fa2",
admin.addPeer("enode://a4565809646676b63158ae959d1ba978af6966e8fcec1377fbff6da407f88b250222b1d3a7fedb0a80fd0395329168e19af6527f36c7e0baec18042f3139eb38@185.244.183.149:30300")
net.peerCount
eth.blockNumber
admin.peers
eth.syncing


