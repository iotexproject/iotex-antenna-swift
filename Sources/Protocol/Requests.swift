//
//  Requests.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/7.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class TransferRequest: ActionRequest {
    var recipient: String
    var amount: String
    var payload: String
    
    init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account, recipient: String, amount: String, payload: String) {
        self.recipient = recipient
        self.amount = amount
        self.payload = payload
        super.init(nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account)
    }
}
