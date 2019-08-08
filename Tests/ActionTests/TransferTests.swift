//
//  TransferTests.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2019/8/8.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_antenna_swift

class TransferTests: XCTestCase {

    func testTransfer() throws {
        let account = try Account(privateKey: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
        let rpc = try RPCMethod(provider: "api.testnet.iotex.one:443", secure: true)
        
        let transfer = try TransferMethod(client: rpc, request: TransferRequest(
            nonce: nil, gasLimit: 100000, gasPrice: "10000000000000", account: account,
            recipient: "io13zt8sznez2pf0q0hqdz2hyl938wak2fsjgdeml", amount: "1000000000000000000", payload: "".data(using: .utf8)!
        ))
        
        do {
            let hash = try transfer.execute()
            print(hash)
        } catch {
            print("Unexpected error: \(error).")
            XCTFail()
        }
    }
}
