pragma solidity ^0.4.23;

// Imports
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

// Main token smart contract
contract ADVToken is MintableToken {
  string public constant name = "Advento";
  string public constant symbol = "ADV";
  uint8 public constant decimals = 18;
}