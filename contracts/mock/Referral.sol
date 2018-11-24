pragma solidity >=0.4.22 <0.6.0;

import "../ReferralInterface.sol";


/**
* @title A simple example of an onchain Referral implementation.
*/
contract Referral is ReferralInterface {

    // Basic struct for User accounts for the test implementation of EIP-1621 for Referral Standard.
    struct User {
        uint256 referralsTotal;
        address referredBy;
        bool registered;
    }

    // Storing users and their referrals.
    mapping(address => User) private _users;

    /**
    * @notice The constructor function.
    */
    constructor () public {
        
    }

    /**
    * @notice Function to register an account without being referred.
    * @dev The function registers an account without referral.
    * @return True if the account was not previously registered.
    */
    function register() public returns (bool) {
        // Check if the account is already registered
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
   * @param referredBy The account that referred the user.
   * @return True if the account was not previously referred or registered, false otherwise.
   */
    function referralRegister(address referredBy) public returns(bool) {
        // Check if account is not already registered.
        if (!isRegistered(msg.sender)) {
        
            // Do not allow the referredBy attribute to be set if user already has been referred.
            if (!isReferred(msg.sender)) {
            
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

    /**
    * @notice [Testing purposes] Function to get the account that referred the `msg.sender`.
    * @dev The function returns the address of the referredBy attribute.
    * @return The address of the account that referred the `msg.sender`.
    */
    function getReferredBy() public view returns(address) {
        return _users[msg.sender].referredBy;
    }
  
    /**
    * @notice [Testing purposes] Function to get the total number of referrals of `msg.sender`.
    * @dev The function returns referralsTotal attribute of the `msg.sender` account.
    * @return Total accounts/users that the `msg.sender` referred.
    */
    function getMyReferralsCount() public view returns(uint256) {
        return _users[msg.sender].referralsTotal;
    }
  
    /**
    * @notice Check if account is already registered.
    * @dev The function checks if the account has `registered` flag on,
    * and if it has already referred users, so that it cannot be used as another's referral.
    * @param account The account that needs to be checked.
    * @return True if the account was previously registered, false otherwise.
    */
    function isRegistered(address account) internal view returns(bool) {
        return (_users[account].registered && _users[account].referralsTotal == 0);
    }
  
    /**
    * @notice Check if account is already referred by someone.
    * @dev The function checks if the account has `referredBy` attribute setted,
    * e.g. if the account already was referred by someone and is his referral.
    * @param account The account that needs to be checked.
    * @return True if the account was referred by someone, false otherwise.
    */
    function isReferred(address account) internal view returns(bool) {
        return _users[account].referredBy != address(0x0);
    }
  
}