//
//  XRC20.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/10.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation
import BigInt

open class XRC20: BaseContract {
    public init(address: String, provider: RPCMethod) throws {
        try super.init(address: address, provider: provider, abi: Abis.XRC20.data(using: .utf8)!)
    }
    
    public func name() throws -> String {
        let result = try self.contract.read(callerAddress: self.contract.address, method: "name", inputs: [])
        if (result.count > 0) {
            return result[0] as! String
        }
        return ""
    }
    
    public func symbol() throws -> String {
        let result = try self.contract.read(callerAddress: self.contract.address, method: "symbol", inputs: [])
        if (result.count > 0) {
            return result[0] as! String
        }
        return ""
    }
    
    public func decimals() throws -> UInt8 {
        let result = try self.contract.read(callerAddress: self.contract.address, method: "decimals", inputs: [])
        if (result.count > 0) {
            return result[0] as! UInt8
        }
        return 0
    }
    
    public func totalSupply() throws -> BigUInt {
        let result = try self.contract.read(callerAddress: self.contract.address, method: "totalSupply", inputs: [])
        if (result.count > 0) {
            return result[0] as! BigUInt
        }
        return BigUInt(0)
    }
    
    public func balanceOf(owner: Address) throws -> BigUInt {
        let result = try self.contract.read(callerAddress: self.contract.address, method: "balanceOf", inputs: [owner])
        if (result.count > 0) {
            return result[0] as! BigUInt
        }
        return BigUInt(0)
    }

    public func transfer(
        to: Address,
        value: BigUInt,
        account: Account,
        gasPrice: String,
        gasLimit: UInt64
    ) throws -> String {
        return try self.contract.execute(nonce: nil, gasLimit: gasLimit, gasPrice: gasPrice, account: account,
                                         method: "transfer", amount: "0", inputs: [to, value])
    }
    
    public func allowance(
        owner: Address,
        spender: Address,
        account: Account,
        gasPrice: String,
        gasLimit: UInt64
    ) throws -> String {
        return try self.contract.execute(nonce: nil, gasLimit: gasLimit, gasPrice: gasPrice, account: account,
                                         method: "allowance", amount: "0", inputs: [owner, spender])
    }

    public func approve(
        spender: Address,
        value: BigUInt,
        account: Account,
        gasPrice: String,
        gasLimit: UInt64
    ) throws -> String {
        return try self.contract.execute(nonce: nil, gasLimit: gasLimit, gasPrice: gasPrice, account: account,
                                         method: "approve", amount: "0", inputs: [spender, value])
    }

    public func transferFrom(
        from: Address,
        to: Address,
        value: BigUInt,
        account: Account,
        gasPrice: String,
        gasLimit: UInt64
    ) throws -> String {
        return try self.contract.execute(nonce: nil, gasLimit: gasLimit, gasPrice: gasPrice, account: account,
                                         method: "transferFrom", amount: "0", inputs: [from, to, value])
    }
}
