//SPDX-License-Identifier: GPL

pragma solidity >= 0.7.0 <0.9.0;

contract HagooCoin {

    string public constant name = "Hagoo Coin";
    string public constant symbol = "HAG";
    uint public constant decimal = 18;

    // MAPPING { key:value }
    // address: 100000 HAG
    mapping(address => uint) balances;

    // Supply
    uint _totalSupply;

    constructor(uint inputValue) {
        _totalSupply = inputValue;
        // msg.sender => your metamask
        balances[msg.sender] = _totalSupply;

    }

    // 1st required function
    function totalSupply() public view returns(uint){
        return _totalSupply;
    }
    
    // 2nd required function
    function balanceOf(address owner) public view returns(uint) {
        return balances[owner];
    }

    // transfer function
    function transfer(address recipient, uint amount) public returns (bool){
        if (balanceOf(msg.sender) >= amount) {
            balances[recipient] += amount;
            balances[msg.sender] -= amount;
            return true;
        }
        else {
            return false;
        }
    }

        function transferFrom(address sender, address recipient, uint amount) public returns (bool){
                if (balanceOf(sender) >= amount) {
                    balances[recipient] += amount;
                    balances[sender] -= amount;
                    return true;
                }
                else {
                    return false;
                }
            }

}