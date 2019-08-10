//
//  BaseContract.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/10.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class BaseContract {
    public var contract: Contract
    
    public init(address: String, provider: RPCMethod, abi: Data) throws {
        self.contract = try Contract(provider: provider, address: address, abi: abi)
    }
}
