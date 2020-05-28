//
//  StakeCreateMethod.swift
//  iotex-antenna-swift
//
//  Created by tianlan on 2020/5/27.
//  Copyright © 2020 IoTeX. All rights reserved.
//



class StakeCreateMethod: AbstractMethod {
    private var request: StakeCreateRequest
    private var envelop: Envelop?
    
    public init(client: RPCMethod, request: StakeCreateRequest) throws {
        self.request = request
        self.envelop = nil
        super.init(client: client, account: request.account)
        self.envelop = try self.baseEnvelop(request)
    }
    
    public func execute() throws -> String {
        self.envelop!.stakeCreate = Iotextypes_StakeCreate.with {
            $0.candidateName = request.candidateName
            $0.stakedDuration = request.stakedDuration
            $0.autoStake = request.autoStake
            $0.stakedAmount = request.stakedAmount
        }
        return try self.sendAction(envelop: self.envelop!)
    }
}
