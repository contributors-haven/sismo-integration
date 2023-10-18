// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import {CheckMembership} from "src/CheckMembership.sol";

contract DeployCheckMembership is Script {
  function run() public {
    vm.startBroadcast();
    CheckMembership checkMembership = new CheckMembership();
    console.log("CheckMembership Contract deployed at", address(checkMembership));
    vm.stopBroadcast();
  }
}
