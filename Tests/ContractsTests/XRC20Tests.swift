//
//  XRC20Tests.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2019/8/10.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_antenna_swift

class XRC20Tests: XCTestCase {
    func testBaseInfo() throws {
        let rpc = try RPCMethod(provider: "api.testnet.iotex.one:443", secure: true)
        let xrc20 = try XRC20(address: "io14j96vg9pkx28htpgt2jx0tf3v9etpg4j9h384m", provider: rpc)
        
        try XCTAssert("Vitality" == xrc20.name())
        try XCTAssert("VITA" == xrc20.symbol())
        try XCTAssert(18 == xrc20.decimals())
        let total = try xrc20.totalSupply()
        print(total)
        let address = Address.init(address: "io1lkg0gxx4a79khszeawsshtng5tcax6v9dx8hna")
        let balance = try xrc20.balanceOf(owner: address)
        print(balance)
    }
}
