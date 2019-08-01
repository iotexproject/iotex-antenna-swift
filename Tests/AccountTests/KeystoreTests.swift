//
//  KeystoreTests.swift
//  iotex-swiftTests
//
//  Created by ququzone on 2019/8/1.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_swift

class KeystoreTests: XCTestCase {
    func testLoadKeystore() throws {
        let decoder = JSONDecoder()
        
        let keystoreData: Data = "{\"version\":3,\"id\":\"dd66ba63-83d8-43d5-ac6f-d79a06394d02\",\"address\":\"3f9c20bcec9de520d88d98cbe07ee7b5ded0dac4\",\"crypto\":{\"ciphertext\":\"b15eaee8da76a4eb3a28ae6e8f6ba96641dc1a433d3d7d2ea87d57b95a27b494\",\"cipherparams\":{\"iv\":\"6a3aac2b8b73a04ef6236edcfff27fc3\"},\"cipher\":\"aes-128-ctr\",\"kdf\":\"scrypt\",\"kdfparams\":{\"dklen\":32,\"salt\":\"d8ca15c771459d43ac75a44893f7ce8949c5e87c07195cb9b0eda10db1409a1a\",\"n\":262144,\"r\":8,\"p\":1},\"mac\":\"5b4400e2b49ba23f75c1bac6724d8759b4870c5c5634e36c33e694cdcf4f363b\"}}".data(using: .utf8)!
        let keystore = try decoder.decode(Keystore.self, from: keystoreData)
        
        let account = try keystore.account(password: "iotexPassw0rd")
        
        XCTAssert(account.address == "io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j")
        XCTAssert(account.publicKey == "044e18306ae9ef4ec9d07bf6e705442d4d1a75e6cdf750330ca2d880f2cc54607c9c33deb9eae9c06e06e04fe9ce3d43962cc67d5aa34fbeb71270d4bad3d648d9")
        XCTAssert(account.privateKey == "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
    }
    
    func testAccontToKeystore() throws {
        let keystore = try Keystore(account: Account.create(privateKey: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f"), password: "123456")
        
        let keystoreJson = try JSONEncoder().encode(keystore)
        print(String(data: keystoreJson, encoding: .utf8)!)
        
        let account = try keystore.account(password: "123456")
        XCTAssert(account.address == "io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j")
    }
}
