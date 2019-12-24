//
//  EK256KTest.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2019/12/20.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_antenna_swift

class EK256KTest: XCTestCase {

    func testSign() throws {
        let sign = try EK256K.sign(payloadJson: "{\"iss\":\"044e18306ae9ef4ec9d07bf6e705442d4d1a75e6cdf750330ca2d880f2cc54607c9c33deb9eae9c06e06e04fe9ce3d43962cc67d5aa34fbeb71270d4bad3d648d9\",\"jti\":\"5d76d2e9ff7cf238522ef71e\",\"sub\":\"5b7a6d21dc6e35e14574d052\",\"exp\":1575844329,\"iat\":1568068329}", secret: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
        XCTAssert(sign == "eyJhbGciOiJFSzI1NksiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiIwNDRlMTgzMDZhZTllZjRlYzlkMDdiZjZlNzA1NDQyZDRkMWE3NWU2Y2RmNzUwMzMwY2EyZDg4MGYyY2M1NDYwN2M5YzMzZGViOWVhZTljMDZlMDZlMDRmZTljZTNkNDM5NjJjYzY3ZDVhYTM0ZmJlYjcxMjcwZDRiYWQzZDY0OGQ5IiwianRpIjoiNWQ3NmQyZTlmZjdjZjIzODUyMmVmNzFlIiwic3ViIjoiNWI3YTZkMjFkYzZlMzVlMTQ1NzRkMDUyIiwiZXhwIjoxNTc1ODQ0MzI5LCJpYXQiOjE1NjgwNjgzMjl9.rC2Vh6J-Xk0N2iHTfzuthVdejQtD_HnV770eLAMBGGgS4YZfW7F_i4pR2FusINtlXxhss5XKYL-NFYCuh_2N0gA")
    }
    
    func testVerify() throws {
        let payload = try EK256K.verify(token: "eyJhbGciOiJFSzI1NksiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiIwNDRlMTgzMDZhZTllZjRlYzlkMDdiZjZlNzA1NDQyZDRkMWE3NWU2Y2RmNzUwMzMwY2EyZDg4MGYyY2M1NDYwN2M5YzMzZGViOWVhZTljMDZlMDZlMDRmZTljZTNkNDM5NjJjYzY3ZDVhYTM0ZmJlYjcxMjcwZDRiYWQzZDY0OGQ5IiwianRpIjoiNWQ3NmQyZTlmZjdjZjIzODUyMmVmNzFlIiwic3ViIjoiNWI3YTZkMjFkYzZlMzVlMTQ1NzRkMDUyIiwiZXhwIjoxNTc1ODQ0MzI5LCJpYXQiOjE1NjgwNjgzMjl9.rC2Vh6J-Xk0N2iHTfzuthVdejQtD_HnV770eLAMBGGgS4YZfW7F_i4pR2FusINtlXxhss5XKYL-NFYCuh_2N0gA")
        XCTAssert(payload == "{\"iss\":\"044e18306ae9ef4ec9d07bf6e705442d4d1a75e6cdf750330ca2d880f2cc54607c9c33deb9eae9c06e06e04fe9ce3d43962cc67d5aa34fbeb71270d4bad3d648d9\",\"jti\":\"5d76d2e9ff7cf238522ef71e\",\"sub\":\"5b7a6d21dc6e35e14574d052\",\"exp\":1575844329,\"iat\":1568068329}")
    }
}
