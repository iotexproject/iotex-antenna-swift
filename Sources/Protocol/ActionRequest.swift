//
//  ActionRequest.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/7.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class ActionRequest {
    public var nonce: UInt64?
    public var gasLimit: UInt64
    public var gasPrice: String
    public var account: Account

    public init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account) {
        self.nonce = nonce
        self.gasLimit = gasLimit
        self.gasPrice = gasPrice
        self.account = account
    }
}
