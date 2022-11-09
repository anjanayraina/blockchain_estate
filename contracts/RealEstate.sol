//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract RealEstate is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private allTokens;
    constructor() ERC721("Land NFT" , "RNFT"){}
    function mint(string calldata tokenURI) public returns (uint256){
        allTokens.increment();
        uint256 newLand = allTokens.current();
        _mint(msg.sender ,newLand);
        _setTokenURI(newLand , tokenURI);
        return newLand;


    }
    function getSupply() public view returns (uint256){
        return allTokens.current();
        
    }


}
