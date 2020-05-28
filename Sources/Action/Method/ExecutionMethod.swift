
//
//  File.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/9.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class ExecutionMethod: AbstractMethod {
    private var request: ExecutionRequest
    private var envelop: Envelop?
    
    public init(client: RPCMethod, request: ExecutionRequest) throws {
        self.request = request
        self.envelop = nil
        super.init(client: client, account: request.account)
        self.envelop = try self.baseEnvelop(request)
    }
    
    public func execute() throws -> String {
        self.envelop!.execution = Iotextypes_Execution.with {
            $0.contract = self.request.contract
            $0.amount = self.request.amount
            $0.data = self.request.data
        }
        return try self.sendAction(envelop: self.envelop!)
    }
}
