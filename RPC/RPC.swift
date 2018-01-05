//
//  RPC.swift
//
//  Created by Boris Polania on 1/3/18.
//  Copyright © 2018 Boris Polania. All rights reserved.
//

import UIKit

class RPC: NSObject {

    var host: String
    var port: String
    var version: String
    
    init(host: String, port: String, version: String = "2.0") {
        self.host = host
        self.port = port
        self.version = version
    }
    
    /*!
     * @brief Calls the eth_getCompilers method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcompilers
     */
    func getCompilers(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_getCompilers"
        jsonDictionary["id"] = 3
        
        HTTPRequest.sendPOSTRequest(host: host, port: port, data: jsonDictionary, completion: { (response) in
            do {
                // Convert the data to JSON
                let jsonSerialized = try JSONSerialization.jsonObject(with: response, options: []) as? [String : Any]
                if let json = jsonSerialized, let result = json["result"] {
                    completion(String(describing: result))
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        })
    }
    
    /*!
     * @brief Calls the eth_accounts method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_accounts
     */
    func accounts(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_accounts"
        jsonDictionary["id"] = 1
        jsonDictionary["params"] = []
        
        HTTPRequest.sendPOSTRequest(host: host, port: port, data: jsonDictionary, completion: { (response) in
            do {
                // Convert the data to JSON
                let jsonSerialized = try JSONSerialization.jsonObject(with: response, options: []) as? [String : Any]
                if let json = jsonSerialized, let result = json["result"] {
                    completion(String(describing: result))
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        })
    }
    
    /*!
     * @brief Calls the web3_sha3 method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_sha3
     * @param data the string that need to be Keccak-256 encoded
     */
    func web3SHA3(data : String, completion: @escaping (_ result: String) -> Void) {
        
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "web3_sha3"
        jsonDictionary["id"] = 64
        jsonDictionary["params"] = [data]
        
        HTTPRequest.sendPOSTRequest(host: host, port: port, data: jsonDictionary, completion: { (response) in
            
            do {
                // Convert the data to JSON
                let jsonSerialized = try JSONSerialization.jsonObject(with: response, options: []) as? [String : Any]
                
                if let json = jsonSerialized, let result = json["result"] {
                    completion(result as! String)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        })

    }
    
    /*!
     * @brief Calls the eth_sendtransaction method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendtransaction
     * @param from the string with the sending account address
     * @param to the string with the receiving contract account address
     * @param data the ABI encoded data to be sent to the contract
     * @see https://github.com/ethereum/wiki/wiki/Ethereum-Contract-ABI
     */
    func sendTransaction(from: String, to : String, data : String, completion: @escaping (_ result: String) -> Void) {
        
        var jsonParamsDictionary = [String: Any]()
        jsonParamsDictionary["from"] = from
        jsonParamsDictionary["to"] = to
        jsonParamsDictionary["data"] = data
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_sendTransaction"
        jsonDictionary["id"] = 8
        jsonDictionary["params"] = [jsonParamsDictionary]
        
        print(jsonDictionary)
        
        HTTPRequest.sendPOSTRequest(host: host, port: port, data: jsonDictionary, completion: { (response) in
            
            do {
                // Convert the data to JSON
                let jsonSerialized = try JSONSerialization.jsonObject(with: response, options: []) as? [String : Any]
                
                if let json = jsonSerialized, let result = json["result"] {
                    completion(result as! String)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        })
        
    }
    
}
