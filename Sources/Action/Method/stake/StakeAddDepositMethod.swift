//
//  StakeAddDepositMethod.swift
//  iotex-antenna-swift
//
//  Created by tianlan on 2020/5/27.
//  Copyright © 2020 IoTeX. All rights reserved.
//

import UIKit

class StakeAddDepositMethod: AbstractMethod {
    private var request: StakeStakeAddDepositRequest
    private var envelop: Envelop?
    
    public init(client: RPCMethod, request: StakeStakeAddDepositRequest) throws {
        self.request = request
        self.envelop = nil
        super.init(client: client, account: request.account)
        self.envelop = try self.baseEnvelop(request)
    }
    
    public func execute() throws -> String {
        self.envelop!.stakeAddDeposit = Iotextypes_StakeAddDeposit.with{
            $0.bucketIndex = request.bucketIndex
            $0.amount = request.amount
        }
        return try self.sendAction(envelop: self.envelop!)
    }
}

public class StakeStakeAddDepositRequest: ActionRequest {
    public var bucketIndex: UInt64
    public var amount: String
    
    public init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account, bucketIndex: UInt64, amount: String) {
        self.bucketIndex = bucketIndex
        self.amount = amount
        super.init(nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account)
    }
}
