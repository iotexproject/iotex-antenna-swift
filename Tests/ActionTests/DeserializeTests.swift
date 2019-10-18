//
//  DeserializeTests.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2019/10/18.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_antenna_swift

class DeserializeTests: XCTestCase {

    func testDeserialize() throws {
        var envelop = Envelop(version: 1, nonce: 2, gasLimit: 10000, gasPrice: "1000000000000")
        
        envelop.transfer = Iotextypes_Transfer.with {
            $0.recipient = "io13zt8sznez2pf0q0hqdz2hyl938wak2fsjgdeml"
            $0.amount = "1000000000000000000"
            $0.payload = "".data(using: .utf8)!
        }
        
        let data = try envelop.byteStream()
        
        let deEnvelop = try Envelop(data: data)
        
        XCTAssert(1 == deEnvelop.version)
        XCTAssert("io13zt8sznez2pf0q0hqdz2hyl938wak2fsjgdeml" == deEnvelop.transfer!.recipient)
    }

}
