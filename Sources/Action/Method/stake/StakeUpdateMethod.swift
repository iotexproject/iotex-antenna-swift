//
//  StakeUpdateMethod.swift
//  iotex-antenna-swift
//
//  Created by tianlan on 2020/5/27.
//  Copyright © 2020 IoTeX. All rights reserved.
//


public class StakeUpdateMethod: AbstractMethod {
    private var request: StakeUpdateRequest
    private var envelop: Envelop?
    
    public init(client: RPCMethod, request: StakeUpdateRequest) throws {
        self.request = request
        self.envelop = nil
        super.init(client: client, account: request.account)
        self.envelop = try self.baseEnvelop(request)
    }
    
    public func execute() throws -> String {
        self.envelop!.candidateUpdate = Iotextypes_CandidateBasicInfo.with {
            $0.name = request.name
            $0.rewardAddress = request.rewardAddress
            $0.operatorAddress = request.operatorAddress
        }
        return try self.sendAction(envelop: self.envelop!)
    }
}

public class StakeUpdateRequest: ActionRequest {
    public var rewardAddress: String
    public var operatorAddress: String
    public var name: String
    
    public init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account, rewardAddress: String, operatorAddress: String, name: String) {
        self.rewardAddress = rewardAddress
        self.operatorAddress = operatorAddress
        self.name = operatorAddress
        super.init(nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account)
    }
}
