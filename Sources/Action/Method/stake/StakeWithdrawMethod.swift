//
//  StakeWithdrawMethod.swift
//  iotex-antenna-swift
//
//  Created by tianlan on 2020/5/27.
//  Copyright © 2020 IoTeX. All rights reserved.
//


class StakeWithdrawMethod: AbstractMethod {
    private var request: StakeWithdrawRequest
    private var envelop: Envelop?
    
    public init(client: RPCMethod, request: StakeWithdrawRequest) throws {
        self.request = request
        self.envelop = nil
        super.init(client: client, account: request.account)
        self.envelop = try self.baseEnvelop(request)
    }
    
    public func execute() throws -> String {
        self.envelop!.stakeWithdraw = Iotextypes_StakeReclaim.with{
            $0.bucketIndex = request.bucketIndex
        }
        return try self.sendAction(envelop: self.envelop!)
    }
}

public class StakeWithdrawRequest: ActionRequest {
    public var bucketIndex: UInt64
    
    public init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account, bucketIndex: UInt64) {
        self.bucketIndex = bucketIndex
        super.init(nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account)
    }
}
