// SPDX-License-Idenifier: MIT
pragma solidity ^0.8.10;

contract SwirlyCoin {
    // Field
    uint public total = 0;

    function viewCounts() public view returns (uint) {
        return total;
    }
    // functions
    function add(uint userInput) public {
        total += userInput;
    }

    function sub() public {
        total -= 1;
    }

}