pragma solidity ^0.4.24;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/ownership/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/math/SafeMath.sol"
import "./ADVToken.sol";

contract Safe is Ownable{
	using SafeMath for uint256;
	uint256 public timingPoint; // точка отчета
	uint256 public tranche; // транш в 12.5% от общей суммы, которую ск будет переводить владельцам раз в период
	uint256 public timePost; // период
	AdventoToken public token; // токен с которым будет работать ск
    
	constructor(AdventoToken _token) public{
		token = _token;
		timePost = 90 * 1 days;
	}
    
    // функция которая фиксирует переведенные токены, точку отчета, а также вычисляет 12,5%
	function fixAmount() public onlyOwner returns(bool){
	    require(timingPoint==0);
		tranche = token.balanceOf(address(this)).mul(125).div(1000); // получаем 12.5% от переведенной на контракт суммы
		timingPoint = now;
		return true;
	}
    
    // функция возвращает количество токенов на балансе контракта
	function getBalance() public view returns(uint256){
		return token.balanceOf(address(this));
	}
	// фукнция возвращает оставшееся время до конца периода
	function getEndOfTimePost() public view returns(uint256){
	    return timingPoint.add(timePost).sub(now);
	}
	// функция получения токенов
	function getTokens() public onlyOwner returns(bool){
		require(timingPoint.add(timePost) <= now && getBalance()!=0);
		token.transfer(owner, tranche);
		timingPoint = timingPoint.add(timePost);
        return true; 
	}
}
