//
//  BIP44Tests.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2020/11/12.
//  Copyright © 2020 IoTeX. All rights reserved.
//

import XCTest
import CryptoSwift
@testable import iotex_antenna_swift

class BIP44Tests: XCTestCase {
    func testDerive() throws {
        let seed = try? BIP39.seedFromMmemonics("clever seek document inner key cook picture radar join eyebrow general sketch")
        let privateKey = BIP44.createPrivateKeyBySeed(path: "m/44'/304'/0'/0/0", seed: seed!)
        print(try! Account.init(privateKey: privateKey!.hexString).address)
        
        XCTAssert("86c87643cecb84922dad9e15795531ff348fa41571ecf08b2651a9ef9a226e89" == privateKey!.hexString)
    }
    
    func testEncrypt() throws {
        let seed = try? BIP39.seedFromMmemonics("clever seek document inner key cook picture radar join eyebrow general sketch")
        
        let aes = try AES(key: Padding.zeroPadding.add(to: "123456".bytes, blockSize: AES.blockSize),blockMode: ECB())
        let encoded = try aes.encrypt(seed!.makeBytes())
        
        let decode = try aes.decrypt(encoded)
        let privateKey = BIP44.createPrivateKeyBySeed(path: "m/44'/304'/0'/0/0", seed: Data(decode))
        XCTAssert("86c87643cecb84922dad9e15795531ff348fa41571ecf08b2651a9ef9a226e89" == privateKey!.hexString)
    }
    
    func testWalletAddress() throws{
        let seed = try? BIP39.seedFromMmemonics("later inspire essay joke vanish system all absurd wide daughter lawsuit vault")
        
        for index in  0...10 {
            let str = "m/44'/304'/0'/0/" + String(index)
            let privateKey = BIP44.createPrivateKeyBySeed(path: str, seed: seed!)
            let account: Account = try Account.create(privateKey: privateKey!.hexString)
            print("===============")
            print(str)
            print(account.privateKey)
            print(account.address)
        }
    }
    
    func testCreate() throws {
        
        let acc = try Account.create()
        let startTime = CFAbsoluteTimeGetCurrent()
        _ = try KeystoreFactory.keystore(from: acc, password: UUID().uuidString)
        let endTime = CFAbsoluteTimeGetCurrent()
        print("++++++KeystoreFactory++++++++\((endTime - startTime)))")
        
}


}
