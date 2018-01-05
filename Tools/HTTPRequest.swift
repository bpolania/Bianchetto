//
//  HTTPRequest.swift
//
//  Created by Boris Polania on 1/3/18.
//  Copyright © 2018 Boris Polania. All rights reserved.
//

import UIKit

class HTTPRequest: NSObject {
    
    /*!
     * @brief Send POST request to the JSON RPC API synchronously
     * @param host string with the endpoint http address, defaults to localhost
     * @param string with port the endpoint port, defaults 8545
     * @param data dictionary with the request body JSON data
     */
    static func sendPOSTRequest(host : String = "localhost", port : String = "8545", data : [String: Any], completion: @escaping (_ result: Data) -> Void) {
        
        var request = URLRequest(url: URL(string: "\(host):\(port)")!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
        
        do {
            let requestObject = try JSONSerialization.data(withJSONObject: data)
            request.httpBody = requestObject
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                completion(data!)
            }
            
            task.resume()
        } catch {
            
        }
        
    }

}
