// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";
 
interface Tk2 is IERC20 {
  function swap(uint _amount) external returns (uint);
}

contract ContractA{
  IERC20 token1;
  Tk2 token2;
  
  // uint fee = 100; // ==  1%
  uint fee = 5000; // ==  50%

    constructor(address _token1, address _token2) {
      token1 = IERC20(_token1);
      token2 = Tk2(_token2);
    }

    function calculateFee(uint amount) private view returns(uint){
      //fee is currently 5_000 which means 50%
      require((amount / 10_000) * 10_000 == amount, 'too small');
      return (amount * fee) / 10_000;
    }

    function trade(uint _amount) external {
      //first get permission from the scriptjs to have the token1 from the user
      token1.transferFrom(msg.sender, address(this), _amount);
      token1.approve(address(token2), _amount);
      uint currentValue = token2.swap(_amount);
      uint leftAfterFee = calculateFee(currentValue);
      token2.transfer(msg.sender, leftAfterFee);
    } 

}
