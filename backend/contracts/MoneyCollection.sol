// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MoneyCollection {
    address public centralGovernment;
    address public stateGovernment;
    address public district;
    address public mlaContractor;
    address public healthcareContractor;
    address public roadTransportContractor;

    constructor() {
        centralGovernment = msg.sender;
    }

    modifier onlyCentralGovernment() {
        require(
            msg.sender == centralGovernment,
            "Only the central government can call this function."
        );
        _;
    }

    modifier onlyStateGovernment() {
        require(
            msg.sender == stateGovernment,
            "Only the state government can call this function."
        );
        _;
    }

    modifier onlyDistrict() {
        require(
            msg.sender == district,
            "Only the district can call this function."
        );
        _;
    }

    modifier onlyMLAContractor() {
        require(
            msg.sender == mlaContractor,
            "Only the MLA contractor can call this function."
        );
        _;
    }

    modifier onlyHealthcareContractor() {
        require(
            msg.sender == healthcareContractor,
            "Only the healthcare contractor can call this function."
        );
        _;
    }

    modifier onlyRoadTransportContractor() {
        require(
            msg.sender == roadTransportContractor,
            "Only the road transport contractor can call this function."
        );
        _;
    }

    function setStateGovernment(address _stateGovernment)
        external
        onlyCentralGovernment
    {
        stateGovernment = _stateGovernment;
    }

    function setDistrict(address _district) external onlyStateGovernment {
        district = _district;
    }

    function setMLAContractor(address _mlaContractor) external onlyDistrict {
        mlaContractor = _mlaContractor;
    }

    function setHealthcareContractor(address _healthcareContractor)
        external
        onlyDistrict
    {
        healthcareContractor = _healthcareContractor;
    }

    function setRoadTransportContractor(address _roadTransportContractor)
        external
        onlyDistrict
    {
        roadTransportContractor = _roadTransportContractor;
    }

    function fundTransfer() external onlyCentralGovernment {
        // Send the tax amount to the state government
        uint256 amount = address(this).balance;
        require(amount > 0, "Amount must be than zero.");
        (bool success, ) = district.call{value: amount}("");
        require(success, "Transfer to State Government failed.");
    }

    function distributeFunds() external onlyDistrict {
        uint256 balance = address(district).balance;
        require(balance > 0, "No funds available for distribution");

        uint256 amountPerRecipient = balance / 3;

        // Transfer funds to MLA's
        (bool success, ) = mlaContractor.call{value: amountPerRecipient}("");
        require(success, "Transfer to MLA's failed.");

        // Transfer funds to Health Care Sector
        (success, ) = healthcareContractor.call{value: amountPerRecipient}("");
        require(success, "Transfer to Health Care sector failed.");

        // Transfer funds to Road & Transport Ministry
        (success, ) = roadTransportContractor.call{value: amountPerRecipient}(
            ""
        );
        require(success, "Transfer to MLA's failed.");

        // Deposit remaining funds back into the district
        uint256 remainingBalance = address(district).balance;
        if (remainingBalance > 0) {
            (success, ) = district.call{value: remainingBalance}("");
            require(success, "Deposit remaining funds into district failed.");
        }
    }
}
