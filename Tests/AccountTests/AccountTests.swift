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
    func testNewAccount() {
        let account = Account(privateKey: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
        print(account.publicKey)
    }
}
