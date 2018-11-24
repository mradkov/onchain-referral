pragma solidity >=0.4.22 <0.6.0;

import "../ReferralInterface.sol";


/**
 * @title A simple example of an onchain Referral implementation.
 */
contract Referral is ReferralInterface {

  struct User {
      uint256 referralsTotal;
      address referredBy;
      bool registered;
  }

  mapping(address => User) private _users;

  /**
  * @notice The constructor function.
  */
  constructor() public {}
  
  function register() public returns(bool) {
        require(
            !isRegistered(msg.sender),
            "User account already registered!"
        );
        
        // Set the registered flag.
        _users[msg.sender].registered = true;
        
        return true;
  }

  /**
   * @notice Assign a "referredBy" attribute to `msg.sender`.
   * @dev The function relys on two internal functions that check
   * if the account is already registered and if it has been referred
   * by other user.
   * @param address referredBy The account that referred the user.
   * @return True if the account was not previously referred or registered, false otherwise.
   */
  function referralRegister(address referredBy) public returns(bool) {
    // Check if account is not already registered.
    if (!isRegistered(msg.sender)) {
    
        // Do not allow the referredBy attribute to be set if user already has been referred.
        if(!isReferred(msg.sender)) {
        
            // Activate account registered flag attribute.
            _users[msg.sender].registered = true;
            
            // Set the referral account.
            _users[msg.sender].referredBy = referredBy;
    
            // Set the referrals value to the new total number of referrals.    
            _users[referredBy].referralsTotal = _users[referredBy].referralsTotal + 1;
    
            return true;
        }
    }
    
    
    return false;
  }
  
  function isRegistered(address account) internal view returns(bool) {
      return (_users[account].registered && _users[account].referralsTotal == 0);
  }
  
  function isReferred(address account) internal view returns(bool) {
      return _users[account].referredBy != address(0x0);
  }
  
  function getReferredBy() public view returns(address) {
        return _users[msg.sender].referredBy;
  }
  
  function getMyReferralsCount() public view returns(uint256) {
        return _users[msg.sender].referralsTotal;
  }
}