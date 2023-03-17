// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { Script } from "forge-std/Script.sol";
import { ZeroLiquidDevelopmentVesting } from "../src/DevelopmentVesting.sol";

/// @dev See the Solidity Scripting tutorial: https://book.getfoundry.sh/tutorials/solidity-scripting
contract DeployFoo is Script {
    ZeroLiquidDevelopmentVesting internal developmentVesting;
    address internal deployer;
    uint256 internal beneficiaryPrivateKey;

    address internal ownerAddress;
    address internal beneficiaryAddress;
    uint256 internal cliffDuration = 7_776_000;
    uint256 internal vestingDuration = 93_312_000;

    function setUp() public virtual {
        string memory mnemonic = vm.envString("MNEMONIC");
        (deployer,) = deriveRememberKey(mnemonic, 0);

        beneficiaryPrivateKey = 0xB0B;
        beneficiaryAddress = vm.addr(beneficiaryPrivateKey);
    }

    function run() public {
        vm.startBroadcast(deployer);
        developmentVesting = new ZeroLiquidDevelopmentVesting(beneficiaryAddress, cliffDuration, vestingDuration);
        vm.stopBroadcast();
    }
}
