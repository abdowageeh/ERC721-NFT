# Wego NFT Collection

A Solidity-based NFT collection implementing the **ERC-721 standard** using OpenZeppelin and Foundry.

The project focuses on NFT creation, token ownership, and on-chain storage of metadata URIs pointing to decentralized content.

## Overview

- **Collection:** Wego NFT
- **Symbol:** WAPE
- **Standard:** ERC-721
- **Solidity:** ^0.8.31
- **Framework:** Foundry
- **Library:** OpenZeppelin

## Core Functionality

- Mint NFTs directly to the caller.
- Assign unique, sequential Token IDs starting from 1.
- Store individual metadata URIs for each token.
- Track NFT ownership through ERC-721.
- Retrieve metadata using `tokenURI()`.

## Testing Coverage

- Collection name and symbol.
- Initial Token ID.
- NFT minting and ownership.
- Token URI storage.
- Sequential Token ID generation.
- Multiple NFT minting.

## Future Development

- Maximum supply limit.
- Minting access control.
- Deployment and verification.
- Enhanced metadata management.

---

**Built with Solidity, Foundry & OpenZeppelin.**
