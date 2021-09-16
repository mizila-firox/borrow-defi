// const [account] = await web3.eth.getAccounts();
// const contractA = await ContractA.deployed();
const Token1 = artifacts.require("Token1.sol");
const Token2 = artifacts.require("Token2.sol");
const ContractA = artifacts.require("ContractA.sol");

module.exports = async () => {
  try {
    const [account] = await web3.eth.getAccounts();
    const token1 = await Token1.deployed();
    const token2 = await Token2.deployed();
    const contractA = await ContractA.deployed();

    // let value = web3.utils.toWei("1");
    //allow contractA x amount from t1
    // token1.approve(contractA.address, value);
    // let account_balance = await token2.balanceOf(account);
    // let contractABalance = await token2.balanceOf(contractA.address);
    // console.log(`initial account balance t2: ${account_balance}`);
    // console.log(`initial contract balance t2: ${contractABalance}`);

    // let receipt = await contractA.trade(value);
    // console.log(receipt);

    account_balance = await token2.balanceOf(account);
    contractABalance = await token2.balanceOf(contractA.address);
    console.log(`after account balance t2: ${account_balance}`);
    console.log(`after contract balance t2: ${contractABalance}`);

    //
  } catch (error) {
    console.log(error);
  }
};
