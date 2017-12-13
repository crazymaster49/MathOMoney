pragma solidity ^0.4.16;

import "./ConvertLib.sol";


contract MetaCoin {
	mapping (address => uint) balances;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	function MetaCoin() public {
		balances[tx.origin] = 10000;
	}
	event CorrectPuzzle(address winnerAddress, uint puzzleIdentifier);
//If else statement not compiling
  /*function checkAnswer(uint answer, uint solution) {
  	if (answer != solution ) return false;
  	answer == solution;
  	return true;
  }*/

	function sendCoin(address receiver, uint amount, uint answer) public returns(bool sufficient) {
		//
	    CorrectPuzzle(receiver, answer);
	    msg.sender.send(5);
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
