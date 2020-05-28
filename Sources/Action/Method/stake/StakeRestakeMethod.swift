//
//  StakeRestakeMethod.swift
//  iotex-antenna-swift
//
//  Created by tianlan on 2020/5/27.
//  Copyright © 2020 IoTeX. All rights reserved.
//


class StakeRestakeMethod: AbstractMethod {
    private var request: StakeRestakeRequest
    private var envelop: Envelop?
    
    public init(client: RPCMethod, request: StakeRestakeRequest) throws {
        self.request = request
        self.envelop = nil
        super.init(client: client, account: request.account)
        self.envelop = try self.baseEnvelop(request)
    }
    
    public func execute() throws -> String {
        self.envelop!.stakeRestake = Iotextypes_StakeRestake.with{
            $0.bucketIndex = request.bucketIndex
            $0.stakedDuration = request.stakedDuration
            $0.autoStake = request.autoStake
        }
        return try self.sendAction(envelop: self.envelop!)
    }
}

public class StakeRestakeRequest: ActionRequest {
    public var bucketIndex: UInt64
    public var stakedDuration: UInt32
    public var autoStake: Bool
    
    public init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account, bucketIndex: UInt64, stakedDuration: UInt32, autoStake: Bool) {
        self.bucketIndex = bucketIndex
        self.stakedDuration = stakedDuration
        self.autoStake = autoStake
        super.init(nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account)
    }
}
