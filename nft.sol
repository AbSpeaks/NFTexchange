
//SPDX - License-Identifier : MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //define the metadata of the nft

    struct NFTMetadata{
        string name;
        string des;
        string image;

    }

    mapping(uint256=>NFTMetadata) private _tokenMetadata;

    constructor() ERC721("MyNFT", "MNFT") {}

    //Function to mint new nft

    function mintNft(address receipent,NFTMetadata memory metadata) public returns(uint256)
    {
        //Increment token id 

        _tokenIds.increment();

        //Get the new token id 

        uint256 newTokenID = _tokenIds.current();

        _mint(receipent, newTokenID);

        return newTokenID;
    }

    function getMetadata(uint256 tokenId) public returns(NFTMetadata memory)
    {
        NFTMetadata memory metadata = _tokenMetadata[tokenId];

        return metadata;
    }

}
