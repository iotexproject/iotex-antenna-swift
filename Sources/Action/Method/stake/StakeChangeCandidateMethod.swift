//
//  StakeChangeCandidateMethod.swift
//  iotex-antenna-swift
//
//  Created by tianlan on 2020/5/27.
//  Copyright © 2020 IoTeX. All rights reserved.
//


public class StakeChangeCandidateMethod: AbstractMethod {
    private var request: StakeChangeCandidateRequest
    private var envelop: Envelop?
    
    public init(client: RPCMethod, request: StakeChangeCandidateRequest) throws {
        self.request = request
        self.envelop = nil
        super.init(client: client, account: request.account)
        self.envelop = try self.baseEnvelop(request)
    }
    
    public func execute() throws -> String {
        self.envelop!.stakeChangeCandidate = Iotextypes_StakeChangeCandidate.with{
            $0.candidateName = request.candidateName
            $0.bucketIndex = request.bucketIndex
        }
        return try self.sendAction(envelop: self.envelop!)
    }
}

public class StakeChangeCandidateRequest: ActionRequest {
    public var bucketIndex: UInt64
    public var candidateName: String
    
    public init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account, bucketIndex: UInt64, candidateName: String) {
        self.bucketIndex = bucketIndex
        self.candidateName = candidateName
        super.init(nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account)
    }
}
