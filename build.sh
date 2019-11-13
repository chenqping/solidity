#!/bin/bash

# compile using solc

BIN=`solc --optimize --bin simplestorage.sol | awk '/Binary:/{x=1;next}x'`
ABI=`solc --optimize --abi simplestorage.sol | awk '/JSON ABI/{x=1;next}x'`

# deploy through geth console
sed s/ABI/$ABI/g template.js | sed s/DATA/$BIN/g  > simplestorage.js
# you only need to unlock your accounts[0] and issue loadScript('simplestorage.js') under the console, the contract creation transaction will be sent to execution.

# deploy through Json-RPC
echo "curl -H \"Accept: application/json\" -H \"Content-type: application/json\" -X POST --data '{\"jsonrpc\":\"2.0\",\"method\":\"eth_sendTransaction\",\"params\":[{\"from\": \"<DEPLOY_ACCOUNT>\",\"data\": \"0x$BIN\"}],\"id\":1}' http://localhost:8545"


#curl -H "Accept: application/json" -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_getTransactionReceipt","params":["TxHash"],"id":1}' http://localhost:3001
