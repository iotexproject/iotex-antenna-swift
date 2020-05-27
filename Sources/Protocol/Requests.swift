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


public class StakeCreateRequest: ActionRequest {
    public var candidateName: String
    public var stakedAmount: String
    public var stakedDuration: UInt32
    public var autoStake: Bool
    public var payload: Data
    
    public init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account, candidateName: String, stakedAmount: String, stakedDuration: UInt32, autoStake: Bool, payload: Data ) {
        self.candidateName = candidateName
        self.stakedAmount = stakedAmount
        self.stakedDuration = stakedDuration
        self.autoStake = autoStake
        self.payload = payload
        super.init(nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account)
    }
}


