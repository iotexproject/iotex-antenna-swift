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
    
    public func getAccount(address: String) throws -> GetAccountResponse {
        var request = Iotexapi_GetAccountRequest.with {
            $0.address = address
        }
        let response = try self.client.getAccount(request)
        return GetAccountResponse(accountMeta: GetAccountResponse.AccountMeta(
            address: response.accountMeta.address,
            balance: response.accountMeta.balance,
            nonce: response.accountMeta.nonce,
            pendingNonce: response.accountMeta.pendingNonce,
            numActions: response.accountMeta.numActions
        ))
    }
}
