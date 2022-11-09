//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract RealEstate is ERC721URIStorage {
    using Counters for Counters.Counter;
    // this is used as a sort of inheritance on the vairable that you are assigening the Counters class 
    // so Counters will get assigned all the functoins of the Class Counters 
    // these inbuilt libraries give us the implementatoin with audited code 
    
    Counters.Counter private tokenCounter;
    constructor() ERC721("Land NFT" , "RNFT"){}
    function mint(string calldata tokenURI) public returns (uint256){
        tokenCounter.increment();
        uint256 newLand = tokenCounter.current();
        _mint(msg.sender ,newLand);
        _setTokenURI(newLand , tokenURI);
        return newLand;


    }
    function getSupply() public view returns (uint256){
        return tokenCounter.current();
        
    }


}
