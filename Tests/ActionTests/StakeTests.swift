//
//  StakeTests.swift
//  iotex-antenna-swiftTests
//
//  Created by tianlan on 2020/5/25.
//  Copyright © 2020 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_antenna_swift

class StakeTests: XCTestCase {
    
    func testStake() throws {
        let account = try Account(privateKey: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
        let rpc = try RPCMethod(provider: "api.testnet.iotex.one:443", secure: true)
        
        let stake = try StakeMethod(client: rpc, request: TransferRequest(
            nonce: nil, gasLimit: 100000, gasPrice: "10000000000000", account: account,
            recipient: "io13zt8sznez2pf0q0hqdz2hyl938wak2fsjgdeml", amount: "1000000000000000000", payload: "".data(using: .utf8)!
        ))
        
        do {
            let hash = try stake.create(candidateName: "aa", stakedDuration: 1, stakedAmount: "1000")
            print(hash)
        }catch{
            print("create Unexpected error: \(error).")
        }
        
        do {
            let hash = try stake.register(ownerAddress: "io13zt8sznez2pf0q0hqdz2hyl938wak2fsjgdeml", stakedAmount: "20", stakedDuration: 2)
            print(hash)
        }catch{
            print("register Unexpected error: \(error).")
        }
        
        do {
            let hash = try stake.unsteke(bucketIndex: 100)
            print(hash)
        }catch{
            print("unsteke Unexpected error: \(error).")
        }
        
        do {
            let hash = try stake.withdraw(bucketIndex: 100)
            print(hash)
        }catch{
            print("withdraw Unexpected error: \(error).")
        }
        
        do {
            let hash = try stake.addDeposit(bucketIndex: 20, amount: "100")
            print(hash)
        }catch{
            print("addDeposit Unexpected error: \(error).")
        }
        
        do {
            let hash = try stake.restake(bucketIndex: 20, stakedDuration: 2)
            print(hash)
        }catch{
            print("restake Unexpected error: \(error).")
        }
        
        do {
            let hash = try stake.changeCandidate(bucketIndex: 20, candidateName: "aa")
            print(hash)
        }catch{
            print("changeCandidate Unexpected error: \(error).")
        }
        
        do {
            let hash = try stake.stakingTransfer(bucketIndex: 29, voterAddress: "io13zt8sznez2pf0q0hqdz2hyl938wak2fsjgdeml")
            print(hash)
        }catch{
            print("stakingTransfer Unexpected error: \(error).")
        }
        
        do {
            let hash = try stake.update(name: "aa", rewardAddress: "io13zt8sznez2pf0q0hqdz2hyl938wak2fsjgdeml", operatorAddress: "io13zt8sznez2pf0q0hqdz2hyl938wak2fsjgdeml")
            print(hash)
        }catch{
            print("update Unexpected error: \(error).")
        }
    }
    
}
