//
//  ConvertTests.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2019/8/10.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_antenna_swift

class ConvertTests: XCTestCase {
    func testFromRau() {
        let rau = "2002000000000000000"
        XCTAssert("2002000000000000000" == Convert.fromRau(number: rau, unit: Convert.Unit.Rau))
        XCTAssert("2002000000000000" == Convert.fromRau(number: rau, unit: Convert.Unit.KRau))
        XCTAssert("2002000000000" == Convert.fromRau(number: rau, unit: Convert.Unit.MRau))
        XCTAssert("2002000000" == Convert.fromRau(number: rau, unit: Convert.Unit.GRau))
        XCTAssert("2002000" == Convert.fromRau(number: rau, unit: Convert.Unit.Qev))
        XCTAssert("2.002" == Convert.fromRau(number: rau, unit: Convert.Unit.Iotx))
        
        let rau2 = "2002000000000000000.3232424324"
        XCTAssert("2002000000000000000" == Convert.fromRau(number: rau2, unit: Convert.Unit.Rau))
    }
    
    func testToRau() {
        let rau = "2002000000000000000"
        XCTAssert(rau == Convert.toRau(number: "2002000000000000000", unit: Convert.Unit.Rau))
        XCTAssert(rau == Convert.toRau(number: "2002000000000000", unit: Convert.Unit.KRau))
        XCTAssert(rau == Convert.toRau(number: "2002000000000", unit: Convert.Unit.MRau))
        XCTAssert(rau == Convert.toRau(number: "2002000000", unit: Convert.Unit.GRau))
        XCTAssert(rau == Convert.toRau(number: "2002000", unit: Convert.Unit.Qev))
        XCTAssert(rau == Convert.toRau(number: "2.002", unit: Convert.Unit.Iotx))
        XCTAssert("10000002000000000000000" == Convert.toRau(number: "10000.002", unit: Convert.Unit.Iotx))
    }
    
    func testRemoveDecimal() {
        var text = "200.32"
        XCTAssert("200" == text.removeDecimal())
        text = "200.32.33"
        XCTAssert("200" == text.removeDecimal())
        text = "0.33"
        XCTAssert("0" == text.removeDecimal())
        text = "-1.33"
        XCTAssert("-1" == text.removeDecimal())
        text = "20000000000.323432"
        XCTAssert("20000000000" == text.removeDecimal())
    }
}
