//SPDX-License-Identifier: GPL

pragma solidity >= 0.7.0 <0.9.0;

contract HagooCoin {

    // talk about events here needed
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    string public constant name = "Hagoo Coin";
    string public constant symbol = "HAG";
    uint public constant decimal = 18;

    // MAPPING { key:value }
    // address: 100000 HAG
    mapping(address => uint) balances;
    // map
    // {0x0}: {0x1(someone else): 100 HAG} } 
    mapping(address => mapping(address => uint) ) allowedTransactions;

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

    function transfer(address receiver, uint numOfTokens) public returns(bool){
        // strictly say if we have enough tokens to send
        require(numOfTokens <= balances[msg.sender], 'Insufficient Tokens');
        // remove number of tokens we are going to send
        balances[msg.sender] -= numOfTokens;
        // send the numbe rof tokens to other user
        balances[receiver] += numOfTokens;
        // event is emitted, we are calling
        emit Transfer(msg.sender, receiver, numOfTokens);
        return true;

    }

    function approve(address receiver, uint numOfTokens  ) public returns (bool){
        // Populate allowed Transactions
        allowedTransactions[msg.sender][receiver] = numOfTokens;
        // emit our approval
        emit Approval(msg.sender, receiver, numOfTokens);
        return true;
    }

    function allowance(address owner, address otherAccount) public view returns (uint){
        return allowedTransactions[owner][otherAccount];
    }

    function transferFrom(address owner, address otherAccount, uint numOfTokens) public returns(bool){
        // set a check using required
        require(numOfTokens <= balances[owner], 'Insufficient Funds');
        // We want to do another,
        // Allowed 
        require(numOfTokens <= allowedTransactions[owner][otherAccount], 'You are not allowed to send to this account');
        balances[owner] -= numOfTokens;
        // send money account to account
        allowedTransactions[owner][msg.sender] -= numOfTokens;
        balances[otherAccount] += numOfTokens;
        emit Transfer(owner, otherAccount, numOfTokens);
        return true;

    }

    //transfer function
    function _transfer(address recipient, uint amount) public returns (bool){
        if (balanceOf(msg.sender) >= amount) {
            balances[recipient] += amount;
            balances[msg.sender] -= amount;
            return true;
        }
        else {
            return false;
        }
    }

        function _transferFrom(address sender, address recipient, uint amount) public returns (bool){
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