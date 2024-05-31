// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract PremiumFeaturePayment is AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant USER_ROLE = keccak256("USER_ROLE");

    IERC20 public dai;

    event PremiumFeaturePurchased(address indexed buyer, uint256 amount);

    constructor(address daiAddress) {
        dai = IERC20(daiAddress);
        _grantRole(ADMIN_ROLE, msg.sender);
    }

    function purchasePremiumFeature(uint256 _amount) external {
        require(hasRole(USER_ROLE, msg.sender), "Caller is not a premium user");
        dai.transferFrom(msg.sender, address(this), _amount);
        emit PremiumFeaturePurchased(msg.sender, _amount);
    }

    function withdrawTokens(uint256 _amount) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        dai.transfer(msg.sender, _amount);
    }

    function isPremiumUser(address _user) external view returns (bool) {
        return hasRole(USER_ROLE, _user);
    }
}
