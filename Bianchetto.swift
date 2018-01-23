//
//  RPC.swift
//  HonDapp
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
     * @brief Calls the web3_clientVersion method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_clientversion
     */
    func web3ClientVersion(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "web3_clientVersion"
        jsonDictionary["id"] = 67
        
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
     * @brief Calls the net_version method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#net_version
     */
    func netVersion(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "net_version"
        jsonDictionary["id"] = 67
        
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
     * @brief Calls the net_peerCount method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#net_peercount
     */
    func net_peerCount(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "net_peerCount"
        jsonDictionary["id"] = 74
        
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
     * @brief Calls the net_listening method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#net_listening
     */
    func netListening(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "net_listening"
        jsonDictionary["id"] = 67
        
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
     * @brief Calls the eth_protocolVersion method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_protocolversion
     */
    func ethProtocolVersion(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_protocolVersion"
        jsonDictionary["id"] = 67
        
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
     * @brief Calls the eth_syncing method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_syncing
     */
    func ethSyncing(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_syncing"
        jsonDictionary["id"] = 1
        
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
     * @brief Calls the eth_coinbase method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_coinbase
     */
    func ethCoinbase(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_coinbase"
        jsonDictionary["id"] = 64
        
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
     * @brief Calls the eth_mining method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_mining
     */
    func ethMining(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_mining"
        jsonDictionary["id"] = 71
        
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
     * @brief Calls the eth_hashrate method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_hashrate
     */
    func ethHashrate(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_hashrate"
        jsonDictionary["id"] = 71
        
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
     * @brief Calls the eth_gasPrice method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gasprice
     */
    func ethGasPrice(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_gasPrice"
        jsonDictionary["id"] = 73
        
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
     * @brief Calls the eth_blockNumber method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_blocknumber
     */
    func ethBlockNumber(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_blockNumber"
        jsonDictionary["id"] = 83
        
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
     * @brief Calls the eth_getBalance method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getbalance
     */
    func ethGetBalance(completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_getBalance"
        jsonDictionary["id"] = 1
        
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
     * @brief Calls the eth_getStorageAt method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getstorageat
     * @param data 20 Bytes - address of the storage
     * @param quantity string with integer of the position in the storage in hex
     * @param quantityTag integer block number, or the string "latest", "earliest" or "pending"
     * @see default block parameter (https://github.com/ethereum/wiki/wiki/JSON-RPC#the-default-block-parameter)
     */
    func ethGetStorageAt(data : String, quantity : String, quantityTag : String, completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_getStorageAt"
        jsonDictionary["id"] = 1
        jsonDictionary["params"] = [data, quantity, quantityTag]
        
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
     * @brief Calls the eth_getTransactionCount method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactioncount
     * @param data 20 Bytes - address
     * @param quantityTag integer block number, or the string "latest", "earliest" or "pending"
     * @see default block parameter (https://github.com/ethereum/wiki/wiki/JSON-RPC#the-default-block-parameter)
     */
    func ethGetTransactionCount(data : String, quantityTag : String, completion: @escaping (_ result: String) -> Void) {
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_getTransactionCount"
        jsonDictionary["id"] = 1
        jsonDictionary["params"] = [data, quantityTag]
        
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
    
    /*!
     * @brief Calls the eth_getLogs method from the JSON RPC API
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getlogs
     * @param object the filter object
     * @see https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newfilter
     */
    func getLogs(object: String, completion: @escaping (_ result: String) -> Void) {
        
        var jsonParamsDictionary = [String: Any]()
        jsonParamsDictionary["topics"] = object
        var jsonDictionary = [String: Any]()
        jsonDictionary["jsonrpc"] = version
        jsonDictionary["method"] = "eth_getLogs"
        jsonDictionary["id"] = 74
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

