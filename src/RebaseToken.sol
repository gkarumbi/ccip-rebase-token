//SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title RebaseToken
 * @author George Karumbi
 * @notice This is a cross-chain rebase token that incentivises users to deposit into a vault and get rewargs
 * @notice The interest rate in the smart contract can only decrease 
 * @notice Each user will have their own interest rate that is the global interest rate at the time of depositing
 * @dev This is an ERC20 token that is used to represe
 */
contract RebaseToken is ERC20{
    //////////////ERRORS///////////////
    error RebaseToken__InterestRateCanOnlyDecrease(uint256 oldInterestRate, uint256 newInterestRate);

    //////////////EVENTS///////////////
    event InterestRateSet(uint256 newInterestRate);
    
    uint256 private s_interestRate = 5e10;
    constructor() ERC20("Rebase Token", "RBT") {}
    /**
     * @notice Set the interest rate in the contract
     * @param _newInterestRate  The new Interest rate is set
     * @dev The interest can only decrease
     */

    function setInterestRate(uint256 _newInterestRate) external {
        if (_newInterestRate < s_interestRate) {
            revert RebaseToken__InterestRateCanOnlyDecrease(s_interestRate,_newInterestRate);
        }
    s_interestRate = _newInterestRate;
    emit InterestRateSet(_newInterestRate);
    }

}