# PremiumFeaturePayment Smart Contract

The PremiumFeaturePayment contract is an Ethereum smart contract that enables users to purchase premium features using the Dai stablecoin (DAI). The contract utilizes the OpenZeppelin library for ERC20 token interactions and access control, ensuring secure and manageable access to contract functions.


### Purchase Premium Features:
Users with the USER_ROLE can purchase premium features by transferring Dai tokens to the contract.

### Admin Controls: 
Admins, identified by the ADMIN_ROLE, can withdraw Dai tokens from the contract.

### Role Management: 
The contract uses role-based access control to manage premium users and administrators.

### daiAddress:
The address of the deployed Dai token contract.
Description:
Initializes the contract with the address of the Dai token contract and grants the deployer the default admin role and admin role.

### _amount:
The amount of Dai tokens to be transferred for purchasing premium features.
Description:
Allows users with the USER_ROLE to purchase premium features by transferring the specified amount of Dai tokens to the contract.

### Access Control Roles
DEFAULT_ADMIN_ROLE: The default admin role, usually assigned to the contract deployer.
ADMIN_ROLE: Role for administrators who can manage roles and withdraw tokens.
USER_ROLE: Role for users who are eligible to purchase premium features.

### Interacting with the Contract
Granting Roles: Admins can grant USER_ROLE to users who are eligible to purchase premium features.
Purchasing Premium Features: Users with the USER_ROLE can call the purchasePremiumFeature function, specifying the amount of Dai tokens to transfer.
Withdrawing Tokens: Admins can withdraw Dai tokens from the contract by calling the withdrawTokens function with the desired amount.
