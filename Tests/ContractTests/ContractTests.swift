//
//  ContractTests.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2019/8/9.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
import BigInt
@testable import iotex_antenna_swift

class ContractTests: XCTestCase {
    let abi = """
[{"constant":false,"inputs":[{"name":"x","type":"uint256"}],"name":"set","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"get","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"_x","type":"uint32"}],"payable":true,"stateMutability":"payable","type":"constructor"}]
"""

    func testExecute() throws {
        let account = try Account(privateKey: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
        let rpc = try RPCMethod(provider: "api.testnet.iotex.one:443", secure: true)
        do {
            let contract = try Contract(provider: rpc, address: "io186s45j3rgvhxh25ec6xk9wap0drtthk3jq4du7", abi: abi.data(using: .utf8)!)
            
            let hash = try contract.execute(nonce: nil, gasLimit: 100000, gasPrice: "1000000000000", account: account,
                                            method: "set", amount: "0", inputs: [BigUInt(100)])
            print(hash)
        } catch {
            print("Unexpected error: \(error).")
            XCTFail()
        }
    }
    
    func testRead() throws {
        let account = try Account(privateKey: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
        let rpc = try RPCMethod(provider: "api.testnet.iotex.one:443", secure: true)
        do {
            let contract = try Contract(provider: rpc, address: "io186s45j3rgvhxh25ec6xk9wap0drtthk3jq4du7", abi: abi.data(using: .utf8)!)
            
            let result = try contract.read(callerAddress: account.address, method: "get", inputs: [])
            print(result)
        } catch {
            print("Unexpected error: \(error).")
            XCTFail()
        }
    }
    
    func testGetLogs() throws {
        let account = try Account(privateKey: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
        let rpc = try RPCMethod(provider: "34.82.6.156:14014", secure: true)
        do {
            let contract = try Contract(provider: rpc, address: "io186s45j3rgvhxh25ec6xk9wap0drtthk3jq4du7", abi: abi.data(using: .utf8)!)
            
            let result = try contract.read(callerAddress: account.address, method: "GetLogs", inputs: [])
            print(result)
        } catch {
            print("Unexpected error: \(error).")
            XCTFail()
        }
    }
}
