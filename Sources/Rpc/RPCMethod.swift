//
//  RpcMethod.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/5.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class RPCMethod {
    private let client: Iotexapi_APIServiceServiceClient
    
    public init(providor: String, secure: Bool) throws {
        self.client = Iotexapi_APIServiceServiceClient(address: providor, secure: secure)
    }
    
    public func getAccount(_ request: Iotexapi_GetAccountRequest) throws -> Iotexapi_GetAccountResponse {
        return try self.client.getAccount(request)
    }
    
    public func getActions(_ request: Iotexapi_GetActionsRequest) throws -> Iotexapi_GetActionsResponse {
        return try self.client.getActions(request)
    }
}
