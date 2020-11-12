//
//  Test.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2020/11/2.
//  Copyright © 2020 IoTeX. All rights reserved.
//

import Foundation
import BigInt

open class AutoDepositContract: BaseContract {
    public init(address: String, provider: RPCMethod) throws {
        try super.init(address: address, provider: provider, abi: Abis.ABI.data(using: .utf8)!)
    }
    
    public func bucket(owner: Address) throws -> BigInt {
        let result = try self.contract.read(callerAddress: self.contract.address, method: "bucket", inputs: [owner])
        if (result.count > 0) {
            return result[0] as! BigInt
        }
        return BigInt(-1)
    }
}
