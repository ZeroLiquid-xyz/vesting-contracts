// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { Script } from "forge-std/Script.sol";
import { ZeroLiquidDevelopmentMarketingVesting } from "../src/DevelopmentVesting.sol";
import { ZeroLiquidGovernanceCommunityVesting } from "./../src/GovernanceVesting.sol";
import { ZeroLiquidIncentiveVesting } from "./../src/IncentiveVesting.sol";
import { ZeroLiquidCoreContributorsVesting } from "./../src/ContributorsVesting.sol";

contract Deployment is Script {
    ZeroLiquidDevelopmentMarketingVesting internal developmentVesting;
    ZeroLiquidGovernanceCommunityVesting internal governanceVesting;
    ZeroLiquidIncentiveVesting internal incentiveVesting;
    ZeroLiquidCoreContributorsVesting internal contributorsVesting;

    address internal developmentBeneficiaryAddress = 0x93acb21dA38Dd48396F0a46cCa6D4d406164244a;
    address internal governanceBeneficiaryAddress = 0x57b4aEE2c9aA08524df28967ef37eA0555d23D87;
    address internal incentiveBeneficiaryAddress = 0x8CF3D38f5bF2Fef18a161bDc8a1967631Bcc7164;
    address internal contributorsBeneficiaryAddress = 0x322AA4997A185242C51a9570eBD7dc330de2d4A9;

    uint256 internal developmentCliffDuration = 7_776_000;
    uint256 internal governanceCliffDuration = 15_552_000;
    uint256 internal incentiveCliffDuration = 15_552_000;
    uint256 internal contributorsCliffDuration = 15_552_000;

    uint256 internal developmentVestingDuration = 93_312_000;
    uint256 internal governanceVestingDuration = 93_312_000;
    uint256 internal incentiveVestingDuration = 93_312_000;
    uint256 internal contributorsVestingDuration = 93_312_000;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

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
