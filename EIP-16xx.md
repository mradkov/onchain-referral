---
eip: 16xx
title: ERC-16xx Onchain Referral Standard
author: Milen Radkov (@mradkov)
discussions-to: https://github.com/ethereum/EIPs/issues/16xx
status: Draft
type: Standards Track
category: ERC
created: 2018-11-24
requires: 165
---


## Simple Summary
<!--"If you can't explain it simply, you don't understand it well enough." Provide a simplified and layman-accessible explanation of the EIP.-->
EIP-16xx provides a interface for implementing an account referall logic to smart contracts.

## Abstract
<!--A short (~200 word) description of the technical issue being addressed.-->
This EIP contains the following core ideas:
1. .... "**Referral Standard**".

## Motivation
<!--The motivation is critical for EIPs that want to change the Ethereum protocol. It should clearly explain why the existing protocol specification is inadequate to address the problem that the EIP solves. EIP submissions without sufficient motivation may be rejected outright.-->
This EIP is motivated by the need for onchain tracking of referred user accounts on some dapps. Onchain saving the referrals will be able to verify information about a given address from a single trusted source **without concerning that it could be manipulated**, and to do so in as simple a manner as possible. It is also motivated by the desire to make user experience with dapps more **flawles and user-friendly** by both the simplicity of the interface as well as by the guarantees on uniqueness provided by the proposed standard.

No existing EIPs for storing referral accounts on-chain found.

This EIP proposes a light-weight abstraction layer for a standard account metadata registry interface. This abstraction layer can sit on top of standards like ERC-20 and ERC-721 or others where accound information is being stored.

## Specification
<!--The technical specification should describe the syntax and semantics of any new feature. The specification should be detailed enough to allow competing, interoperable implementations for any of the current Ethereum platforms (go-ethereum, parity, cpp-ethereum, ethereumj, ethereumjs, and [others](https://github.com/ethereum/wiki/wiki/Clients)).-->
The Referral interface contains four functions, outlined as follows:

## Rationale
<!--The rationale fleshes out the specification by describing what motivated the design and why particular design decisions were made. It should describe alternate designs that were considered and related work, e.g. how the feature is supported in other languages. The rationale may also provide evidence of consensus within the community, and should discuss important objections or concerns raised during discussion.-->
This standard extends ...

## Backwards Compatibility
<!--All EIPs that introduce backwards incompatibilities must include a section describing these incompatibilities and their severity. The EIP must explain how the author proposes to deal with these incompatibilities. EIP submissions without a sufficient backwards compatibility treatise may be rejected outright.-->
There are no backwards compatibility concerns.

## Test Cases
<!--Test cases for an implementation are mandatory for EIPs that are affecting consensus changes. Other EIPs can choose to include links to test cases if applicable.-->
Targeted test cases with 100% code coverage can be found at ...

## Implementation
<!--The implementations must be completed before any EIP is given status "Final", but it need not be completed before the EIP is accepted. While there is merit to the approach of reaching consensus on the specification and rationale before writing code, the principle of "rough consensus and running code" is still useful when it comes to resolving many discussions of API details.-->
The basic implementation that follows can be found at ...

## Copyright
Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
