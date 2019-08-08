//
//  Requests.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/7.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class TransferRequest: ActionRequest {
    public var recipient: String
    public var amount: String
    public var payload: Data
    
    public init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account, recipient: String, amount: String, payload: Data) {
        self.recipient = recipient
        self.amount = amount
        self.payload = payload
        super.init(nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account)
    }
}

public class ExecutionRequest: ActionRequest {
    public var contract: String
    public var amount: String
    public var data: Data
    
    public init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account, contract: String, amount: String, data: Data) {
        self.contract = contract
        self.amount = amount
        self.data = data
        super.init(nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account)
    }
}
