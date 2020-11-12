//
//  BucketTest.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2020/11/2.
//  Copyright © 2020 IoTeX. All rights reserved.
//

import XCTest
import BigInt
@testable import iotex_antenna_swift

class BucketTest: XCTestCase {

    func testBaseInfo() throws {
        let rpc = try RPCMethod(provider: "api.iotex.one:443", secure: true)
        let test = try AutoDepositContract(address: "io108ckwzlzpkhva7cnfceajlu7wu6ql5kq95uat9", provider: rpc)
        
        let address = Address.init(address: "io163l2vyqhmvwfa70lfjucenrp8ctac0sfevg59y")
        let bucket = try test.bucket(owner: address)
        print(bucket)
    }

}
