//
//  Types.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/5.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public struct GetAccountRequest {
    var address: String
}

public struct GetAccountResponse {
    var accountMeta: Iotextypes_AccountMeta
}

public struct GetActionsRequest {
    var byIndex: GetActionsByIndexRequest?
    
    var byHash: GetActionByHashRequest?
    
    var byAddr: GetActionsByAddressRequest?
    
    var unconfirmedByAddr: GetUnconfirmedActionsByAddressRequest?
    
    var byBlk: GetActionsByBlockRequest?
    
    public struct GetActionsByIndexRequest {
        var start: UInt64
        
        var count: UInt64
    }
    
    public struct GetActionByHashRequest {
        var actionHash: String
        
        var checkPending: Bool
    }
    
    public struct GetActionsByAddressRequest {
        var address: String
        
        var start: UInt64
        
        var count: UInt64
    }
    
    public struct GetUnconfirmedActionsByAddressRequest {
        var address: String
        
        var start: UInt64
        
        var count: UInt64
    }
    
    public struct GetActionsByBlockRequest {
        var blkHash: String
        
        var start: UInt64
        
        var count: UInt64
    }
    
    func to() -> Iotexapi_GetActionsRequest {
        var requst = Iotexapi_GetActionsRequest()
        
        if byIndex != nil {
            requst.byIndex = Iotexapi_GetActionsByIndexRequest.with {
                $0.start = byIndex!.start
                $0.count = byIndex!.count
            }
        }
        
        if byHash != nil {
            requst.byHash = Iotexapi_GetActionByHashRequest.with {
                $0.actionHash = byHash!.actionHash
                $0.checkPending = byHash!.checkPending
            }
        }
        
        if byAddr != nil {
            requst.byAddr = Iotexapi_GetActionsByAddressRequest.with {
                $0.address = byAddr!.address
                $0.start = byAddr!.start
                $0.count = byAddr!.count
            }
        }
        
        if unconfirmedByAddr != nil {
            requst.unconfirmedByAddr = Iotexapi_GetUnconfirmedActionsByAddressRequest.with {
                $0.address = unconfirmedByAddr!.address
                $0.start = unconfirmedByAddr!.start
                $0.count = unconfirmedByAddr!.count
            }
        }
        
        if byBlk != nil {
            requst.byBlk = Iotexapi_GetActionsByBlockRequest.with {
                $0.blkHash = byBlk!.blkHash
                $0.start = byBlk!.start
                $0.count = byBlk!.count
            }
        }
        
        return requst
    }
}

public struct GetActionsResponse {
    var total: UInt64
    
    var actionInfo: [Iotexapi_ActionInfo]
}
