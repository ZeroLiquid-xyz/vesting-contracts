// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19 <0.9.0;

import "forge-std/Test.sol";
import "./../src/DevelopmentVesting.sol";

contract DevelopmentVestingTest is Test {
    ZeroLiquidDevelopmentVesting internal developmentVesting;

    uint256 internal _ownerPrivateKey;
    uint256 internal _beneficiaryPrivateKey;

    address internal _ownerAddress;
    address internal _beneficiaryAddress;
    uint256 internal _cliffDuration = 7_776_000;
    uint256 internal _vestingDuration = 93_312_000;

    function setUp() public {
        _ownerPrivateKey = 0xA11CE;
        _beneficiaryPrivateKey = 0xB0B;

        _ownerAddress = vm.addr(_ownerPrivateKey);
        _beneficiaryAddress = vm.addr(_beneficiaryPrivateKey);

        developmentVesting = new ZeroLiquidDevelopmentVesting(_beneficiaryAddress, _cliffDuration, _vestingDuration);
    }

    function test_Beneficiary() public {
        assertEq(developmentVesting.beneficiary(), _beneficiaryAddress);
    }

    function test_CliffDuration() public {
        assertEq(developmentVesting.cliff(), _cliffDuration + developmentVesting.start());
    }

    function test_VestingDuration() public {
        assertEq(developmentVesting.duration(), _vestingDuration);
    }
}
