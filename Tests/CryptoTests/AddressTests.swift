//
//  AddressTests.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2019/8/9.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_antenna_swift

class AddressTests: XCTestCase {

    func testFromAddress()  {
        let addrStr = "io1c9f8zsnmtmjycadje92l8ncsat0a2ke707jkfa"
        let addr = Address(address: addrStr)
        XCTAssert("c15271427b5ee44c75b2c955f3cf10eadfd55b3e" == addr.bytes.hexString())
    }
    
    func testFromBytes() throws {
        let addr = try Address(payload: "c15271427b5ee44c75b2c955f3cf10eadfd55b3e".hexBytes())
        XCTAssert("io1c9f8zsnmtmjycadje92l8ncsat0a2ke707jkfa" == addr.string)
    }
}
