//
//  StakeTransferMethod.swift
//  iotex-antenna-swift
//
//  Created by tianlan on 2020/5/27.
//  Copyright © 2020 IoTeX. All rights reserved.
//

class StakeTransferMethod: AbstractMethod {
    private var request: StakeTransferRequest
    private var envelop: Envelop?
    
    public init(client: RPCMethod, request: StakeTransferRequest) throws {
        self.request = request
        self.envelop = nil
        super.init(client: client, account: request.account)
        self.envelop = try self.baseEnvelop(request)
    }
    
    public func execute() throws -> String {
        self.envelop!.stakeTransferOwnership = Iotextypes_StakeTransferOwnership.with {
            $0.voterAddress = request.voterAddress
            $0.bucketIndex = request.bucketIndex
        }
        return try self.sendAction(envelop: self.envelop!)
    }
}

public class StakeTransferRequest: ActionRequest {
    public var bucketIndex: UInt64
    public var voterAddress: String
    
    public init(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account, bucketIndex: UInt64, voterAddress: String) {
        self.bucketIndex = bucketIndex
        self.voterAddress = voterAddress
        super.init(nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account)
    }
}
