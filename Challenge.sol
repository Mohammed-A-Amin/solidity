//SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;


contract Token {
    string public storeName = "Store";
    uint public totalProfit = 0;
    uint public ownerEarnings = 0;
    uint public employeeShare = 0;
    uint numEmployees = 50;
    function buyMultipleItems(uint amount, uint price) public {
        uint totalPurchase = amount*price;
        totalProfit += totalPurchase;
    }
    //This function calculates the owners payemnts (5%) of the total profits
    function getOwnerPayment() public returns(uint) {
        uint paymentAmount = (totalProfit*10)/100;
        ownerEarnings = paymentAmount;
        return ownerEarnings;
    }

    function viewOwnersPayment() public view returns(uint) {
        return ownerEarnings;
    }

    function splitProfits() public returns (uint) {
        employeeShare = (totalProfit - ownerEarnings)/numEmployees;
        uint extraOwnerEarnings = (totalProfit - ownerEarnings)%numEmployees;
        ownerEarnings += extraOwnerEarnings;
        return employeeShare;
    }

    function buyItem(uint price) public {
        totalProfit += price;
    }

    function returnItem(uint price) public {
        totalProfit -= price;
    }

    function viewProfits() public view returns(uint) {
        return totalProfit;
    }
}