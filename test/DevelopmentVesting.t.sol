// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19 <0.9.0;

import "forge-std/Test.sol";
import "./../src/DevelopmentVesting.sol";
import "./../src/GovernanceVesting.sol";
import "./../src/IncentivesVesting.sol";
import "./../src/ContributorsVesting.sol";

contract DevelopmentVestingTest is Test {
    DevelopmentMarketingVesting internal developmentVesting;
    GovernanceCommunityVesting internal governanceVesting;
    IncentivesVesting internal incentiveVesting;
    CoreContributorsVesting internal contributorsVesting;

    uint256 internal ownerPrivateKey;
    uint256 internal developmentBeneficiaryPrivateKey;
    uint256 internal governanceBeneficiaryPrivateKey;
    uint256 internal incentiveBeneficiaryPrivateKey;
    uint256 internal contributorsBeneficiaryPrivateKey;

    address internal ownerAddress;
    address internal developmentBeneficiaryAddress;
    address internal governanceBeneficiaryAddress;
    address internal incentiveBeneficiaryAddress;
    address internal contributorsBeneficiaryAddress;

    uint256 internal developmentVestingCliffDuration = 7_776_000;
    uint256 internal governanceVestingCliffDuration = 15_552_000;
    uint256 internal incentiveVestingCliffDuration = 15_552_000;
    uint256 internal contributorsVestingCliffDuration = 15_552_000;

    uint256 internal developmentVestingDuration = 93_312_000;
    uint256 internal governanceVestingDuration = 93_312_000;
    uint256 internal incentiveVestingDuration = 93_312_000;
    uint256 internal contributorsVestingDuration = 93_312_000;

    function setUp() public {
        ownerPrivateKey = 0xA11CE;
        developmentBeneficiaryPrivateKey = 0xB0B;
        governanceBeneficiaryPrivateKey = 0xC0C;
        incentiveBeneficiaryPrivateKey = 0xD0D;
        contributorsBeneficiaryPrivateKey = 0xE0E;

        ownerAddress = vm.addr(ownerPrivateKey);
        developmentBeneficiaryAddress = vm.addr(developmentBeneficiaryPrivateKey);
        governanceBeneficiaryAddress = vm.addr(governanceBeneficiaryPrivateKey);
        incentiveBeneficiaryAddress = vm.addr(incentiveBeneficiaryPrivateKey);
        contributorsBeneficiaryAddress = vm.addr(contributorsBeneficiaryPrivateKey);

        developmentVesting =
        new DevelopmentMarketingVesting(developmentBeneficiaryAddress, developmentVestingCliffDuration, developmentVestingDuration);
        governanceVesting =
        new GovernanceCommunityVesting(governanceBeneficiaryAddress, governanceVestingCliffDuration, governanceVestingDuration);
        incentiveVesting =
            new IncentivesVesting(incentiveBeneficiaryAddress, incentiveVestingCliffDuration, incentiveVestingDuration);
        contributorsVesting =
        new CoreContributorsVesting(contributorsBeneficiaryAddress, contributorsVestingCliffDuration, contributorsVestingDuration);
    }

    function test_DevelopmentVestingBeneficiary() public {
        assertEq(developmentVesting.beneficiary(), developmentBeneficiaryAddress);
    }

    function test_DevelopmentVestingCliff() public {
        assertEq(developmentVesting.cliff(), developmentVestingCliffDuration + developmentVesting.start());
    }

    function test_DevelopmentVestingDuration() public {
        assertEq(developmentVesting.duration(), developmentVestingDuration);
    }

    function test_GovernanceVestingBeneficiary() public {
        assertEq(governanceVesting.beneficiary(), governanceBeneficiaryAddress);
    }

    function test_GovernanceVestingCliff() public {
        assertEq(governanceVesting.cliff(), governanceVestingCliffDuration + governanceVesting.start());
    }

    function test_GovernanceVestingDuration() public {
        assertEq(governanceVesting.duration(), governanceVestingDuration);
    }

    function test_IncentiveVestingBeneficiary() public {
        assertEq(incentiveVesting.beneficiary(), incentiveBeneficiaryAddress);
    }

    function test_IncentiveVestingCliff() public {
        assertEq(incentiveVesting.cliff(), incentiveVestingCliffDuration + incentiveVesting.start());
    }

    function test_IncentiveVestingDuration() public {
        assertEq(incentiveVesting.duration(), incentiveVestingDuration);
    }

    function test_ContributorsVestingBeneficiary() public {
        assertEq(contributorsVesting.beneficiary(), contributorsBeneficiaryAddress);
    }

    function test_ContributorsVestingCliff() public {
        assertEq(contributorsVesting.cliff(), contributorsVestingCliffDuration + contributorsVesting.start());
    }

    function test_ContributorsVestingDuration() public {
        assertEq(contributorsVesting.duration(), contributorsVestingDuration);
    }
}
