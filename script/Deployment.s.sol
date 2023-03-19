// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { Script } from "forge-std/Script.sol";
import { DevelopmentMarketingVesting } from "../src/DevelopmentVesting.sol";
import { GovernanceCommunityVesting } from "./../src/GovernanceVesting.sol";
import { IncentivesVesting } from "./../src/IncentivesVesting.sol";
import { CoreContributorsVesting } from "./../src/ContributorsVesting.sol";

contract Deployment is Script {
    DevelopmentMarketingVesting internal developmentVesting;
    GovernanceCommunityVesting internal governanceVesting;
    IncentivesVesting internal incentivesVesting;
    CoreContributorsVesting internal contributorsVesting;

    address internal developmentBeneficiaryAddress = 0x6fF9474923510C0D41d246b9f39259cbf4E5ebA3;
    address internal governanceBeneficiaryAddress = 0xAF8794cDA6Aa82e7E0589B0684a24A47C161f9e2;
    address internal incentiveBeneficiaryAddress = 0x5B9Dd9C8e2DDfb91Ed1a6DFCf2A0A0605e2F6BF3;
    address internal contributorsBeneficiaryAddress = 0x9FA1B904ba1E29ed45E183EFE6a47aCDC2d15eFA;

    uint256 internal developmentCliffDuration = 7_776_000;
    uint256 internal governanceCliffDuration = 15_552_000;
    uint256 internal incentiveCliffDuration = 2_592_000;
    uint256 internal contributorsCliffDuration = 15_552_000;

    uint256 internal developmentVestingDuration = 85_536_000;
    uint256 internal governanceVestingDuration = 93_312_000;
    uint256 internal incentiveVestingDuration = 80_352_000;
    uint256 internal contributorsVestingDuration = 93_312_000;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        developmentVesting = new DevelopmentMarketingVesting(developmentBeneficiaryAddress, developmentCliffDuration,
        developmentVestingDuration);

        governanceVesting = new GovernanceCommunityVesting(governanceBeneficiaryAddress, governanceCliffDuration,
        governanceVestingDuration);

        incentivesVesting = new IncentivesVesting(incentiveBeneficiaryAddress, incentiveCliffDuration,
        incentiveVestingDuration);

        contributorsVesting = new CoreContributorsVesting(contributorsBeneficiaryAddress, contributorsCliffDuration,
        contributorsVestingDuration);

        vm.stopBroadcast();
    }
}
