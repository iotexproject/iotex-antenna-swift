//
//  XRC20Tests.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2019/8/10.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
import BigInt
@testable import iotex_antenna_swift

class XRC20Tests: XCTestCase {
    func testBaseInfo() throws {
        let rpc = try RPCMethod(provider: "api.testnet.iotex.one:443", secure: true, chainID: 2)
        let xrc20 = try XRC20(address: "io14j96vg9pkx28htpgt2jx0tf3v9etpg4j9h384m", provider: rpc)
        
        try XCTAssert("Vitality" == xrc20.name())
        try XCTAssert("VITA" == xrc20.symbol())
        try XCTAssert(18 == xrc20.decimals())
        let total = try xrc20.totalSupply()
        print(total)
        let address = try Address.init(address: "io1lkg0gxx4a79khszeawsshtng5tcax6v9dx8hna")
        let balance = try xrc20.balanceOf(owner: address)
        print(balance)
    }
    
    func testDecodeMethod() throws {
        let rpc = try RPCMethod(provider: "api.testnet.iotex.one:443", secure: true, chainID: 2)
        let xrc20 = try XRC20(address: "io14j96vg9pkx28htpgt2jx0tf3v9etpg4j9h384m", provider: rpc)
        
        let data = try xrc20.contract.decodeMethod(data: "a9059cbb000000000000000000000000fd90f418d5ef8b6bc059eba10bae68a2f1d369850000000000000000000000000000000000000000000000000de0b6b3a7640000")!
        XCTAssert(data.method == "transfer")
        XCTAssert((data.data["_to"] as! Address).string == "io1lkg0gxx4a79khszeawsshtng5tcax6v9dx8hna")
        XCTAssert(data.data["_value"] as! BigUInt == BigUInt("1000000000000000000"))
    }
}
