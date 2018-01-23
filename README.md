# Bianchetto
Bianchetto is an Ethereum Developer Framework for iOS

### Warnings

* Please note that it's at a very early stage, therefore there's still **a lot** to be done.
* It has *only been tested with TestRPC running locally*.
* Executions of multiple arguments functions hasn't been properly tested and it'll probably crash.

### Installation

Just drop the folllowing files and folders into your project:

* Bianchetto.swift
* RPC
* Tools

### Description

Bianchetto has two main parts: the JSON RPC API interface as the defined at the [JSON RPC API specification](https://github.com/ethereum/wiki/wiki/JSON-RPC) and the framework.


#### JSON RPC API specification

From this specification only the following methods are implemented:

* web3_clientVersion
* web3_sha3
* net_version
* net_peerCount
* net_listening
* eth_protocolVersion
* eth_syncing
* eth_coinbase
* eth_mining
* eth_hashrate
* eth_gasPrice
* eth_accounts
* eth_blockNumber
* eth_getBalance
* eth_getStorageAt
* eth_getTransactionCount
* eth_getCompilers
* eth_sendTransaction
* eth_getLogs

The following improvements are pending and planned:

* Complete all the methods.
* For some of the implemented methods results can be formatted to be more friendly (e.g. eth_getStorageAt and eth_getTransactionCount)

#### Framework

The `executeFunction` method is intended to emulate [Truffle's functionality](http://truffleframework.com/docs/getting_started/contracts#executing-contract-functions).
but it's still limited to only two ABI types: `string` and `uint256`, nevertheless 
still can only manage values that don't exceed 32 bytes.

The following improvements are pending and planned:

* Complete all the types in the [Ethereum Contract ABI specification](https://github.com/ethereum/wiki/wiki/Ethereum-Contract-ABI).
* Allow for values greater than 32 bytes.

### Swift Example

```solidity
function update(string newMessage) {
    message = newMessage;
}
```

It executes the `update`  function with the `Test String` value for the `newMessage` argument, from the `0xdbd5cc227eab854a53108dbcee38245e1582bb80` account to the contract with the `0xddee8fbd7d0c5d119d44ac1af31a8d4d7121870a` address deployed to a locally hosted testRPC.

```swift
let bianchetto = Bianchetto.init(host: "http://localhost", port: "8545")
bianchetto.executeFunction(fromAccountAddress: "0xdbd5cc227eab854a53108dbcee38245e1582bb80", toContractAddress: "0xddee8fbd7d0c5d119d44ac1af31a8d4d7121870a", name: "update", arguments: ["string":"Test String"])
```

### Other Required Improvements

* Migrate `Format` class from `Objective-C` to `Swift`
