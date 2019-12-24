//
//  iotex_swiftTests.swift
//  iotex-swiftTests
//
//  Created by ququzone on 2019/7/31.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_antenna_swift

class AccountTests: XCTestCase {
    func testLoadAccount() throws {
        let account = try Account(privateKey: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
        XCTAssert(account.address == "io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j")
        XCTAssert(account.publicKey == "044e18306ae9ef4ec9d07bf6e705442d4d1a75e6cdf750330ca2d880f2cc54607c9c33deb9eae9c06e06e04fe9ce3d43962cc67d5aa34fbeb71270d4bad3d648d9")
    }
    
    func testNewAccount() throws {
        let account = try Account.create()
        print(account.privateKey)
        print(account.publicKey)
        print(account.address)
    }
    
    func testSign() throws {
        let account = try Account(privateKey: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
        let signed = try account.sign(message: "IoTeX is the auto-scalable and privacy-centric blockchain.".bytes)
        XCTAssert(signed.hexString() == "99f4ef1005ae6c43548520e08dd11477e9ea59317087f9c6f33bc79eb701b14b043ff0d177bc419e585c0ecae42420fabb837e602c8a3578ea17dd1a8ed862e301")
        
        let address = try account.recover(signature: signed, message: "IoTeX is the auto-scalable and privacy-centric blockchain.".bytes)
        
        XCTAssert(address == "io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j")
    }
}
