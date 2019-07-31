//
//  iotex_swiftTests.swift
//  iotex-swiftTests
//
//  Created by ququzone on 2019/7/31.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_swift

class AccountTests: XCTestCase {
    func testNewAccount() throws {
        let account = try Account(privateKey: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
        XCTAssert(account.address == "io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j")
        XCTAssert(account.publicKey == "044e18306ae9ef4ec9d07bf6e705442d4d1a75e6cdf750330ca2d880f2cc54607c9c33deb9eae9c06e06e04fe9ce3d43962cc67d5aa34fbeb71270d4bad3d648d9")
    }
}
