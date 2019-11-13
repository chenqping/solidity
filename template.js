var simplestorageContract = web3.eth.contract(ABI);
var simplestorage = simplestorageContract.new(
   {
     from: web3.eth.accounts[0], 
     data: '0xDATA', 
     gas: '4700000'
   }, function (e, contract){
    console.log(e, contract);
    if (typeof contract.address !== 'undefined') {
         console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
    }
 })
