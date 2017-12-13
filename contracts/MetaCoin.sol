pragma solidity ^0.4.16;

import "./ConvertLib.sol";
// Answers to the math problems
	 uint puzzle1 = 50;
	 uint puzzle2 = 120;
	 uint puzzle3 = 43;
// event Angular will check if math problem answer is correct
	 event correctPuzzle (
	  uint _puzzle1,
	  uint _puzzle2,
	  uint _puzzle3
	         );

contract MetaCoin {
	mapping (address => uint) balances;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	function MetaCoin() public {
		balances[tx.origin] = 10000;
	}
// need avice to add event into this send coin so if math puzzle is correct the coin will auto send to their adress.
	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		Transfer(msg.sender, receiver, amount);
		return true;
	}

	function getBalanceInEth(address addr) public view returns(uint){
		return ConvertLib.convert(getBalance(addr),2);
	}

	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}
}
