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

    function setGovernmentAddresses(address _stateGovernment, address _district)
        external
        onlyCentralGovernment
    {
        stateGovernment = _stateGovernment;
        district = _district;
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

    // Example function to simulate tax collection
    function collectTax(uint256 amount) external onlyCentralGovernment {
        // Send the tax amount to the state government
        // stateGovernment.transfer(amount);
        // Note: The above line is deprecated in newer versions of Solidity. You can use a more secure approach like using the Withdraw Pattern or a library like OpenZeppelin's SafeERC20.
    }

    // Implement other functions as per your requirements

    // Remember to add proper access control mechanisms to ensure only authorized parties can call specific functions.
}
