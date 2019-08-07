//
//  Requests.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/7.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public struct TransferRequest {
    public var nonce: UInt64
    public var gasLimit: UInt64
    public var gasPrice: String
    public var account: Account
    public var recipient: String
    public var amount: String
    public var payload: String
}
