//
//  TransferMethod.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/8.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class TransferMethod: AbstractMethod {
    private var request: TransferRequest
    private var envelop: Envelop?
    
    public init(client: RPCMethod, request: TransferRequest) throws {
        self.request = request
        self.envelop = nil
        super.init(client: client, account: request.account)
        self.envelop = try self.baseEnvelop(request)
    }
    
    public func execute() throws -> String {
        self.envelop!.transfer = Iotextypes_Transfer.with {
            $0.recipient = self.request.recipient
            $0.amount = self.request.amount
            $0.payload = self.request.payload
        }
        return try self.sendAction(envelop: self.envelop!)
    }
}
