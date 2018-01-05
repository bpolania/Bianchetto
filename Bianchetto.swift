//
//  Bianchetto.swift
//
//  Created by Boris Polania on 1/4/18.
//  Copyright © 2018 Boris Polania. All rights reserved.
//

import UIKit

class Bianchetto: NSObject {

    let rpc : RPC
    
    init(host: String, port: String) {
        rpc = RPC.init(host: host, port: port)
    }
    
    /*!
     * @brief executes a contracts function
     * @brief execution equivalent to Truffle transactions
     * @see http://truffleframework.com/docs/getting_started/contracts#executing-contract-functions
     * @param from the string with the sending account address
     * @param to the string with the receiving contract account address
     * @param name the string with the name of the function
     * @param arguments dictionary with the arguments types and value [type : value] it only accepts ABI defined types
     * @see https://github.com/ethereum/wiki/wiki/Ethereum-Contract-ABI
     */
    func executeFunction(fromAccountAddress: String, toContractAddress: String, name: String, arguments : [String : Any]) {
        
        var fullArgumentsHexString = ""
        var fullArgumentsHexStringTemp = ""
        var methodIdArgs = ""
        var argumentsValuesDictionary : [Int : String] = [:]
        var offsetIndex = arguments.count
        
        for i in 0..<arguments.count {
            
            if Array(arguments.keys)[i] == "uint256" {
                fullArgumentsHexString = fullArgumentsHexString + Format.encodeUInt256ArgumentValue(Int32(Array(arguments.values)[i] as! Int))
                let argumentValue = Format.encodeUInt256ArgumentValue(Int32(Array(arguments.values)[i] as! Int))
                argumentsValuesDictionary[i] = argumentValue!
            }
            
            if Array(arguments.keys)[i] == "string" {
                let offset = String(format:"%064X", 32).lowercased()
                let string = Array(arguments.values)[i] as! String
                let data = string.data(using: .utf8)!
                let hexString = Format.hex(toString: data)!
                let size = String(format:"%064X", (hexString.lengthOfBytes(using: .utf8))/2).lowercased()
                let paddedHexString = hexString.padding(toLength: 64, withPad: "0", startingAt: 0) as Any
                fullArgumentsHexString = fullArgumentsHexString +  "\(offset)\(size)\(paddedHexString)"
                argumentsValuesDictionary[i] = offset
                argumentsValuesDictionary[offsetIndex] = "\(size)\(paddedHexString)"
                offsetIndex += 1
            }
            
            methodIdArgs = methodIdArgs + Array(arguments.keys)[i]
            
            if i < arguments.count - 1 {
                methodIdArgs = methodIdArgs + ","
            }
        }
        
        for i in 0...arguments.count {
            fullArgumentsHexStringTemp += argumentsValuesDictionary[i]!
        }
        
        rpc.web3SHA3(data: "\(name)(\(methodIdArgs))", completion: { (result) in
            let methodId = "\(Format.getMethodId(result)!)"
            let contractData = "0x\(methodId)\(fullArgumentsHexStringTemp)"
            self.rpc.sendTransaction(from: fromAccountAddress, to: toContractAddress, data: contractData, completion: { (response) in
                print("Response:\(response)")
            })
        })
    }

}
