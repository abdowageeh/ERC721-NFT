// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

import {Test} from "forge-std/Test.sol";
import {NFT} from "../src/NFT.sol";

contract NFTTest is Test {
    NFT public nft;

    address public user1;
    address public user2;

    string constant TOKEN_URI = "ipfs://QmExample123/metadata.json";

    function setUp() public {
        nft = new NFT();

        user1 = makeAddr("user1");
        user2 = makeAddr("user2");
    }

    // Test constructor name
    function test_name() public view {
        assertEq(nft.name(), "Wego NFT");
    }

    // Test constructor symbol
    function test_symbol() public view {
        assertEq(nft.symbol(), "WAPE");
    }

    // Test initial token ID
    function test_initialTokenId() public {
        vm.prank(user1);

        uint256 tokenId = nft.mintNFT(TOKEN_URI);

        assertEq(tokenId, 1);
    }

    // Test NFT ownership after minting
    function test_mintNFT() public {
        vm.prank(user1);

        uint256 tokenId = nft.mintNFT(TOKEN_URI);

        assertEq(nft.ownerOf(tokenId), user1);
    }

    // Test token URI
    function test_tokenURI() public {
        vm.prank(user1);

        uint256 tokenId = nft.mintNFT(TOKEN_URI);

        assertEq(nft.tokenURI(tokenId), TOKEN_URI);
    }

    // Test second NFT gets token ID 2
    function test_secondMintGetsNextTokenId() public {
        vm.prank(user1);
        nft.mintNFT(TOKEN_URI);

        vm.prank(user2);
        uint256 secondTokenId = nft.mintNFT(TOKEN_URI);

        assertEq(secondTokenId, 2);
    }

    // Test multiple NFTs ownership
    function test_multipleMinting() public {
        vm.prank(user1);
        nft.mintNFT(TOKEN_URI);

        vm.prank(user2);
        nft.mintNFT(TOKEN_URI);

        assertEq(nft.ownerOf(1), user1);
        assertEq(nft.ownerOf(2), user2);
    }

    // Test different token URIs
    function test_differentTokenURIs() public {
        string memory uri1 = "ipfs://metadata1.json";
        string memory uri2 = "ipfs://metadata2.json";

        vm.prank(user1);
        nft.mintNFT(uri1);

        vm.prank(user2);
        nft.mintNFT(uri2);

        assertEq(nft.tokenURI(1), uri1);
        assertEq(nft.tokenURI(2), uri2);
    }
}
