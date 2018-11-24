pragma solidity >=0.4.22 <0.6.0;


/**
 * @title Referral interface. EIP-16xx ID: 0x0
 */
interface ReferralInterface {

    function referralJoin(address account) external returns (bool);

}