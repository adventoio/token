pragma solidity ^0.4.23;

// Imports
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/distribution/RefundableCrowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/price/IncreasingPriceCrowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";

contract ADVCrowdsale is MintedCrowdsale, Ownable, TimedCrowdsale, RefundableCrowdsale, IncreasingPriceCrowdsale, CappedCrowdsale {
  constructor(
    MintableToken _token,
    uint256 _rate,
    address _wallet,
    uint256 _openingTime,
    uint256 _closingTime,
    uint256 _goal,
    uint256 _initialRate,
    uint256 _finalRate,
    uint256 _cap
  )
    public
    Crowdsale(_rate, _wallet, _token)
    TimedCrowdsale(_openingTime, _closingTime)
    RefundableCrowdsale(_goal)
    IncreasingPriceCrowdsale(_initialRate, _finalRate)
    CappedCrowdsale(_cap)
  {
    
  }
}