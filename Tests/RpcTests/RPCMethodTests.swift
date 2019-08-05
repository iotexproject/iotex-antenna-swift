//
//  RPCMethodTests.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2019/8/5.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_antenna_swift

class RPCMethodTests: XCTestCase {

    func testGetAccount() throws {
        let rpc = try RPCMethod(providor: "api.testnet.iotex.one:80")
        let response = try rpc.getAccount(address: "io126xcrjhtp27end76ac9nmx6px2072c3vgz6suw")
        XCTAssert(response.accountMeta.address == "io126xcrjhtp27end76ac9nmx6px2072c3vgz6suw")
    }

}
