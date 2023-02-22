const Web3 = require('web3');

const endpoint = '<https://mainnet.infura.io/v3/5c962efce6834f3491ee33f37224861a >';
const web3 = new Web3(new Web3.providers.HttpProvider(endpoint));

async function getFirstContractBlock() {
  const latestBlock = await web3.eth.getBlockNumber();
  for (let i = latestBlock; i >= 0; i--) {
    const block = await web3.eth.getBlock(i, true);
    for (let j = 0; j < block.transactions.length; j++) {
      const tx = block.transactions[j];
      if (tx.to === null) {
        return i;
      }
    }
  }
}

getFirstContractBlock().then(blockNumber => {
  console.log(`The first contract-creation transaction is in block ${blockNumber}`);
});