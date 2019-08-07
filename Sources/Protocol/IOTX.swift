//
//  IOTX.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/7.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class IOTX {
    private var provider: RPCMethod
    
    public init(provider: String, secure: Bool) throws {
        self.provider = try RPCMethod(provider: provider, secure: secure)
    }
    
    public func setProvider(provider: String, secure: Bool) throws {
        try self.provider.setProvider(provider: provider, secure: secure)
    }
    
    public func sendTransfer(_ request: TransferRequest) throws -> String {
        return "TODO"
    }
}
