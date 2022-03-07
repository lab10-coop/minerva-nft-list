minerva-nft-list
================

A list of NFT Erc721 and Erc1155 contracts with metadata for the [Minerva Wallet](https://minerva.digital/).

It is inspired by https://tokenlists.org/ . Compared to tokenlists it is missing the `decimals` field, additionally we have an `override` field.


How to add your NFT project
---------------------------

[Create an issue](https://github.com/lab10-coop/minerva-nft-list/issues/new?assignees=&labels=add+collection&template=add-new-nft-collection-with-icon.md&title=Add+NFT+collection%3A+%3CName%3E) or a pull request and provide `name`, `address`, `symbol`, `chainId`, `logoURI` and set `override`. All are required.

- `name` and `symbol` are strings analog to [ERC-721](https://eips.ethereum.org/EIPS/eip-721). They also need to be provided for ERC-1155 NFTs.
- `address` is an [eip-55](https://eips.ethereum.org/EIPS/eip-55) (checksum) address where a EIP-721 or EIP-1155 contract is deployed on the chain specified with `chainId`.
- `chainId` is the id of the chain where there is a NFT contract deployed according to `address`. See https://chainlist.org/ to find the correct `chainId`.
- `logoURI` is a URI pointing to an image that represents a NFT contract, sometimes called NFT collection. We prefer simple and small SVG images and otherwise accept PNGs.
- `override` should be set to `false` by default. Only if the `name` and `symbol` should override what is provided by the contract itself set it to `true`.


todo
----

 - add platform contracts and collections. check:
   - https://rarible.com/
   - https://xdai.unique.one
   - gitcoin kudos
   - https://cargo.build/
   - https://superrare.com/
   - https://opensea.io/
   - https://knownorigin.io/
   - https://www.larvalabs.com/cryptopunks
   - https://www.cryptokitties.co/
   - https://dappradar.com/nft/marketplaces
   - uniswap v3
 - should it have info about Erc721 vs. Erc1155?
