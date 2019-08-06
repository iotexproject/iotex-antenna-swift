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
    
    public init(providor: String) throws {
        self.client = Iotexapi_APIServiceServiceClient(address: providor, secure: true)
    }
    
    public func getAccount(_ request: GetAccountRequest) throws -> GetAccountResponse {
        let response = try self.client.getAccount(Iotexapi_GetAccountRequest.with {
            $0.address = request.address
        })
        return GetAccountResponse(accountMeta: response.accountMeta)
    }
    
    public func getActions(_ request: GetActionsRequest) throws -> GetActionsResponse {
        let response = try self.client.getActions(request.to())
        return GetActionsResponse(total: response.total, actionInfo: response.actionInfo)
    }
}
