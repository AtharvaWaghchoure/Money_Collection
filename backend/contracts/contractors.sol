// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract contractor{
    // string task;
    // mapping(string => uint256) public reqirementsToAmount;
    string[] public works;
    uint256[] public amounts;
    // uint256 totalPairsInMapping;

    function addWork(string memory work, uint256 amount) public {
        works.push(work);
        amounts.push(amount);
        // totalPairsInMapping++;
    }

    // function requestToState() public returns(string memory, uint256){
    // }
}