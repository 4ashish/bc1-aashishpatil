pragma solidity ^0.8.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol';
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/Counters.sol";
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/access/Ownable.sol';

contract OpenNFT is ERC721,Ownable{
    
    using Counters for Counters.Counter;
    Counters.Counter public tokenIds;
    
    constructor() public ERC721("Linkin Park Live at Pune", "LPP") {}
    
    mapping (uint256 => address) private _tokenOwner;
    mapping (uint256 => address) private _tokenApprovals;
    mapping (address => uint256) private _ownedTokensCount;
    mapping (address => mapping (address => bool)) private _operatorApprovals;
    
    function mint(address to, uint256 tokenId) public onlyOwner {
        _mint(to, tokenId);
    }
    
    function balanceOf(address owner) public view virtual override returns (uint256) {
        require(owner != address(0));
        return _ownedTokensCount[owner];
    }
    
    function ownerOf(uint256 tokenId) public view virtual override returns (address) {
        address owner = _tokenOwner[tokenId];
        require(owner != address(0));
        return owner;
    }
    
    function approve(address to, uint256 tokenId) public virtual override {
        address owner = ownerOf(tokenId);
        require(to != owner);
        require(msg.sender == owner || isApprovedForAll(owner, msg.sender));
        _tokenApprovals[tokenId] = to;
        
    }
    
    
    
    
  
   
}