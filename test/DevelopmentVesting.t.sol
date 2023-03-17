// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19 <0.9.0;

import "forge-std/Test.sol";
import "./../src/DevelopmentVesting.sol";

contract DevelopmentVestingTest is Test {
    ZeroLiquidDevelopmentVesting internal developmentVesting;

    uint256 internal ownerPrivateKey;
    uint256 internal beneficiaryPrivateKey;

    address internal ownerAddress;
    address internal beneficiaryAddress;
    uint256 internal cliffDuration = 7_776_000;
    uint256 internal vestingDuration = 93_312_000;

    function setUp() public {
        ownerPrivateKey = 0xA11CE;
        beneficiaryPrivateKey = 0xB0B;

        ownerAddress = vm.addr(ownerPrivateKey);
        beneficiaryAddress = vm.addr(beneficiaryPrivateKey);

        developmentVesting = new ZeroLiquidDevelopmentVesting(beneficiaryAddress, cliffDuration, vestingDuration);
    }

    function test_Beneficiary() public {
        assertEq(developmentVesting.beneficiary(), beneficiaryAddress);
    }

    function test_Cliff() public {
        assertEq(developmentVesting.cliff(), cliffDuration + developmentVesting.start());
    }

    function test_VestingDuration() public {
        assertEq(developmentVesting.duration(), vestingDuration);
    }
}
