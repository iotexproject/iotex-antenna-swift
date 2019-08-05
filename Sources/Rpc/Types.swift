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
    var accountMeta: AccountMeta
    
    public struct AccountMeta {
        var address: String
        
        var balance: String
        
        var nonce: UInt64
        
        var pendingNonce: UInt64
        
        var numActions: UInt64
    }
}
