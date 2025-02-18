// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24 ;

import {Test, console} from "forge-std/Test.sol";
import {RebaseToken} from "../src/RebaseToken.sol";
import {Vault} from "../src/Vault.sol";
import{RebaseTokenPool} from "../src/RebaseTokenPool.sol";

import {CCIPLocalSimulatorFork} from "@chainlink-local/src/ccip/CCIPLocalSimulatorFork.sol";

import{IRebaseToken} from "../src/interfaces/IRebaseToken.sol";

contract CrossChainTest is Test{
    uint256 sepoliaFork;
    uint256 arbSepoliaFork;
    CCIPLocalSimulatorFork ccipLocalSimulatorFork;
    function setUp() public{

        sepoliaFork = vm.createSelectFor("sepolia-eth");
        arbSepoliaFork = vm.createFork("arb-sepolia");

        ccipLocalSimulatorFork = new CCIPLocalSimulatorFork();
        vm.makePersistent(address(ccipLocalSimulatorFork));
        

    }
}
