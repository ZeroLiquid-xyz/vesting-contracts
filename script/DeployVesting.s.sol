// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { Script } from "forge-std/Script.sol";
import { ZeroLiquidDevelopmentMarketingVesting } from "../src/DevelopmentVesting.sol";
import { ZeroLiquidGovernanceCommunityVesting } from "./../src/GovernanceVesting.sol";
import { ZeroLiquidIncentiveVesting } from "./../src/IncentiveVesting.sol";
import { ZeroLiquidCoreContributorsVesting } from "./../src/ContributorsVesting.sol";

/// @dev See the Solidity Scripting tutorial: https://book.getfoundry.sh/tutorials/solidity-scripting
contract DeployVesting is Script {
    ZeroLiquidDevelopmentMarketingVesting internal developmentVesting;
    ZeroLiquidGovernanceCommunityVesting internal governanceVesting;
    ZeroLiquidIncentiveVesting internal incentiveVesting;
    ZeroLiquidCoreContributorsVesting internal contributorsVesting;

    address internal deployer;
    uint256 internal developmentBeneficiaryPrivateKey;
    uint256 internal governanceBeneficiaryPrivateKey;
    uint256 internal incentiveBeneficiaryPrivateKey;
    uint256 internal contributorsBeneficiaryPrivateKey;

    address internal developmentBeneficiaryAddress;
    address internal governanceBeneficiaryAddress;
    address internal incentiveBeneficiaryAddress;
    address internal contributorsBeneficiaryAddress;

    uint256 internal developmentCliffDuration = 7_776_000;
    uint256 internal governanceCliffDuration = 15_552_000;
    uint256 internal incentiveCliffDuration = 15_552_000;
    uint256 internal contributorsCliffDuration = 15_552_000;

    uint256 internal developmentVestingDuration = 93_312_000;
    uint256 internal governanceVestingDuration = 93_312_000;
    uint256 internal incentiveVestingDuration = 93_312_000;
    uint256 internal contributorsVestingDuration = 93_312_000;

    function setUp() public virtual {
        string memory mnemonic = vm.envString("MNEMONIC");
        (deployer,) = deriveRememberKey(mnemonic, 0);

        developmentBeneficiaryPrivateKey = 0xB0B;
        developmentBeneficiaryAddress = vm.addr(developmentBeneficiaryPrivateKey);

        governanceBeneficiaryPrivateKey = 0xC0C;
        governanceBeneficiaryAddress = vm.addr(governanceBeneficiaryPrivateKey);

        incentiveBeneficiaryPrivateKey = 0xD0D;
        incentiveBeneficiaryAddress = vm.addr(incentiveBeneficiaryPrivateKey);

        contributorsBeneficiaryPrivateKey = 0xE0E;
        contributorsBeneficiaryAddress = vm.addr(contributorsBeneficiaryPrivateKey);
    }

    function run() public {
        vm.startBroadcast(deployer);
        developmentVesting =
        new ZeroLiquidDevelopmentMarketingVesting(developmentBeneficiaryAddress, developmentCliffDuration, developmentVestingDuration);

        governanceVesting =
        new ZeroLiquidGovernanceCommunityVesting(governanceBeneficiaryAddress, governanceCliffDuration, governanceVestingDuration);

        incentiveVesting =
        new ZeroLiquidIncentiveVesting(incentiveBeneficiaryAddress, incentiveCliffDuration, incentiveVestingDuration);

        contributorsVesting =
        new ZeroLiquidCoreContributorsVesting(contributorsBeneficiaryAddress, contributorsCliffDuration, contributorsVestingDuration);

        vm.stopBroadcast();
    }
}
