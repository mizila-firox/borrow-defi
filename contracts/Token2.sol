// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Token2 is ERC20{
 IERC20 token1;

 constructor(address _token1) ERC20('Token2', 'TK2'){
   token1 = IERC20(_token1);
 }

 function swap(uint _amount) external returns(uint){
   token1.transferFrom(msg.sender, address(this), _amount);
   uint currentValue = _amount * 1;
   _mint(msg.sender, currentValue);
   return currentValue;
 }
 
}