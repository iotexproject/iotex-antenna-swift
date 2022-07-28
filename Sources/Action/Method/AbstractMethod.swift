//
//  AbstractMethod.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/7.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class AbstractMethod {
    var client: RPCMethod
    var account: Account
    
    public init(client: RPCMethod, account: Account) {
        self.client = client
        self.account = account
    }
    
    public func baseEnvelop(_ request: ActionRequest) throws -> Envelop {
        if (request.nonce == nil) {
            let response = try self.client.getAccount(Iotexapi_GetAccountRequest.with {
                $0.address = account.address
            });
            request.nonce = response.accountMeta.pendingNonce
        }
        return Envelop(version: 1, nonce: request.nonce!, gasLimit: request.gasLimit, gasPrice: request.gasPrice, chainID: client.chainID)
    }
    
    public func sendAction(envelop: Envelop) throws -> String {
        let response = try self.client.sendAction(Iotexapi_SendActionRequest.with{
            $0.action = try self.signAction(envelop: envelop).action()
        })
        return response.actionHash
    }

    public func signAction(envelop: Envelop) throws -> SealedEnvelop {
        return try SealedEnvelop(privateKey: self.account.privateKey.hexBytes(), publicKey: self.account.publicKey.hexBytes(), envelop: envelop);
    }
}
