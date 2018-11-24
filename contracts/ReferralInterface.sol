pragma solidity >=0.4.22 <0.6.0;


/**
 * @title Referral interface. EIP-1621 ID: 0x0
 */
interface ReferralInterface {

    function referralRegister(address account) external returns (bool);

}