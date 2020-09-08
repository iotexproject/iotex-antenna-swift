//
//  BIP39Tests.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2020/9/8.
//  Copyright © 2020 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_antenna_swift

class BIP39Tests: XCTestCase {

    func testGenerate()  {
        let words = try? BIP39.generateMnemonics(bitsOfEntropy: 128)
        print("words: " + words!)
    }

    func test() throws {
        let seed = try? BIP39.seedFromMmemonics("bonus enemy toward slender kiss game only angry lens rifle auction brick")
        let privateKey = BIP32.generatePrivateKey(seed: seed!)
        XCTAssert("bdde8969dff56cb3c43de4ecc0d5e895bc6805f8591ea2ee70298ff8e4534822" == privateKey)
    }

}
