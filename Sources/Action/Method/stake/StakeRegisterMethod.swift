//
//  StakeRegisterMethod.swift
//  iotex-antenna-swift
//
//  Created by tianlan on 2020/5/27.
//  Copyright © 2020 IoTeX. All rights reserved.
//


public class StakeRegisterMethod: AbstractMethod {
    private var request: StakeRegisterRequest
    private var envelop: Envelop?
    
    public init(client: RPCMethod, request: StakeRegisterRequest) throws {
        self.request = request
        self.envelop = nil
        super.init(client: client, account: request.account)
        self.envelop = try self.baseEnvelop(request)
    }
    
    public func execute() throws -> String {
        self.envelop!.candidateRegister = Iotextypes_CandidateRegister.with {
            $0.ownerAddress = request.ownerAddress
            $0.stakedAmount = request.stakedAmount
            $0.autoStake = request.autoStake
            $0.stakedDuration = request.stakedDuration
        }
        return try self.sendAction(envelop: self.envelop!)
    }
}

public class StakeRegisterRequest: ActionRequest {
    public var stakedDuration: UInt32
    public var ownerAddress: String
    public var stakedAmount: String
    public var autoStake: Bool
    
    public init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account, stakedDuration: UInt32, ownerAddress: String, stakedAmount : String, autoStake: Bool) {
        self.stakedDuration = stakedDuration
        self.ownerAddress = ownerAddress
        self.stakedAmount = stakedAmount
        self.autoStake = autoStake
        super.init(nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account)
    }
}
