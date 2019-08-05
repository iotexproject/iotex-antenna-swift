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
        return GetAccountResponse(accountMeta: GetAccountResponse.AccountMeta(
            address: response.accountMeta.address,
            balance: response.accountMeta.balance,
            nonce: response.accountMeta.nonce,
            pendingNonce: response.accountMeta.pendingNonce,
            numActions: response.accountMeta.numActions
        ))
    }
}
