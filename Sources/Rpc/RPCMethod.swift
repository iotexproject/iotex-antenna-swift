//
//  RpcMethod.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/5.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class RPCMethod {
    private var client: Iotexapi_APIServiceServiceClient
    
    public init(provider: String, secure: Bool) throws {
        self.client = Iotexapi_APIServiceServiceClient(address: provider, secure: secure)
    }
    
    public func setProvider(provider: String, secure: Bool) throws {
        self.client = Iotexapi_APIServiceServiceClient(address: provider, secure: secure)
    }

    public func getAccount(_ request: Iotexapi_GetAccountRequest) throws -> Iotexapi_GetAccountResponse {
        return try self.client.getAccount(request)
    }
    
    public func getActions(_ request: Iotexapi_GetActionsRequest) throws -> Iotexapi_GetActionsResponse {
        return try self.client.getActions(request)
    }
    
    public func getBlockMetas(_ request: Iotexapi_GetBlockMetasRequest) throws -> Iotexapi_GetBlockMetasResponse {
        return try self.client.getBlockMetas(request)
    }
    
    public func getChainMeta(_ request: Iotexapi_GetChainMetaRequest) throws -> Iotexapi_GetChainMetaResponse {
        return try self.client.getChainMeta(request)
    }
    
    public func getServerMeta(_ request: Iotexapi_GetServerMetaRequest) throws -> Iotexapi_GetServerMetaResponse {
        return try self.client.getServerMeta(request)
    }
    
    public func sendAction(_ request: Iotexapi_SendActionRequest) throws -> Iotexapi_SendActionResponse {
        return try self.client.sendAction(request)
    }
    
    public func getReceiptByAction(_ request: Iotexapi_GetReceiptByActionRequest) throws -> Iotexapi_GetReceiptByActionResponse {
        return try self.client.getReceiptByAction(request)
    }
    
    public func readContract(_ request: Iotexapi_ReadContractRequest) throws -> Iotexapi_ReadContractResponse {
        return try self.client.readContract(request)
    }
    
    public func suggestGasPrice(_ request: Iotexapi_SuggestGasPriceRequest) throws -> Iotexapi_SuggestGasPriceResponse {
        return try self.client.suggestGasPrice(request)
    }
    
    public func estimateGasForAction(_ request: Iotexapi_EstimateGasForActionRequest) throws -> Iotexapi_EstimateGasForActionResponse {
        return try self.client.estimateGasForAction(request)
    }
    
    public func readState(_ request: Iotexapi_ReadStateRequest) throws -> Iotexapi_ReadStateResponse {
        return try self.client.readState(request)
    }
    
    public func getEpochMeta(_ request: Iotexapi_GetEpochMetaRequest) throws -> Iotexapi_GetEpochMetaResponse {
        return try self.client.getEpochMeta(request)
    }
}
