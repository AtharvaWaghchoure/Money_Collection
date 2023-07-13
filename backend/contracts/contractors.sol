// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

struct Task{
    string[] work;
    uint256[] amount;
}

contract contractor{
    string[] public works;
    uint256[] public amounts;
    Task task;

    function addWork(string memory work, uint256 amount) public {
        works.push(work);
        amounts.push(amount);
    }

    function newTask() public{
        task = Task(works,amounts);
    }

    // function requestToState() public returns(string memory, uint256){
    // }
}