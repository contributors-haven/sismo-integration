// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/console.sol";
import "sismo-connect-solidity/SismoConnectLib.sol"; // <--- add a Sismo Connect import

/*
 * @title Airdrop
 * @author Sismo
 * @dev Simple Airdrop contract that mints ERC20 tokens to the msg.sender
 * This contract is used for tutorial purposes only
 * It will be used to demonstrate how to integrate Sismo Connect
 */
contract CheckMembership is SismoConnect {
  
  using SismoConnectHelper for SismoConnectVerifiedResult;
  
  // add your appId
  bytes16 private _appId = 0x13acd90f1ab192cdd936293ee2ea759f;
  // use impersonated mode for testing
  bool private _isImpersonationMode = true;
  bytes16 public constant GROUP_ID = 0xb014033ea7797096beaa0c0a38d7f046;

  constructor()
    SismoConnect(buildConfig(_appId, _isImpersonationMode)) // <--- Sismo Connect constructor
  {}

  function checkMember(bytes memory response) public view returns (bool) {
    console.log("entered claimWithSismo");
      
    SismoConnectVerifiedResult memory result = verify({
        responseBytes: response,
        // we want the user to prove that he owns a Sismo Vault
        // we are recreating the auth request made in the frontend to be sure that 
        // the proofs provided in the response are valid with respect to this auth request
        auth: buildAuth({authType: AuthType.VAULT}),
        claim: buildClaim({
                  groupId: GROUP_ID,
                  value: 1, 
                  claimType: ClaimType.GTE
              }),
        // we also want to check if the signed message provided in the response is the signature of the user's address
        signature:  buildSignature({message: abi.encode(msg.sender)})
      });

    return true;
  }
}
