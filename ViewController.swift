//
//  ViewController.swift
//
//  Created by Boris Polania on 1/2/18.
//  Copyright © 2018 Boris Polania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         * The following calls the following function:
         *
         * function update(string newMessage) {
         *    message = newMessage;
         * }
         *
         * with the "Test String" value for the `newMessage` argument,
         * from the "0xdbd5cc227eab854a53108dbcee38245e1582bb80" account
         * to the contract with the "0xddee8fbd7d0c5d119d44ac1af31a8d4d7121870a" address
         * deployed to a locally hosted testRPC
         *
        */
        let bianchetto = Bianchetto.init(host: "http://localhost", port: "8545")
        bianchetto.executeFunction(fromAccountAddress: "0xdbd5cc227eab854a53108dbcee38245e1582bb80", toContractAddress: "0xddee8fbd7d0c5d119d44ac1af31a8d4d7121870a", name: "update", arguments: ["string":"Test String"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

