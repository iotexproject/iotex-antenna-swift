//
//  RPCMethodTests.swift
//  iotex-antenna-swiftTests
//
//  Created by ququzone on 2019/8/5.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import XCTest
@testable import iotex_antenna_swift

class RPCMethodTests: XCTestCase {

    func testGetAccount() throws {
        let rpc = try RPCMethod(providor: "api.testnet.iotex.one:443")
        let response = try rpc.getAccount(GetAccountRequest(address: "io126xcrjhtp27end76ac9nmx6px2072c3vgz6suw"))
        XCTAssert(response.accountMeta.address == "io126xcrjhtp27end76ac9nmx6px2072c3vgz6suw")
        print(response)
    }
    
    func testGetActionsByIndex() throws {
        let rpc = try RPCMethod(providor: "api.testnet.iotex.one:443")
        let response = try rpc.getActions(GetActionsRequest(
            byIndex: GetActionsRequest.GetActionsByIndexRequest(start: 100, count: 10),
            byHash: nil,
            byAddr: nil,
            unconfirmedByAddr: nil,
            byBlk: nil
        ))
        print(response.actionInfo[0].actHash)
    }
    
    func testGetActionsByHash() throws {
        let rpc = try RPCMethod(providor: "api.testnet.iotex.one:443")
        let response = try rpc.getActions(GetActionsRequest(
            byIndex: nil,
            byHash: GetActionsRequest.GetActionByHashRequest(actionHash: "1c9b40a3d945871521f4f1103d5e3f1736eb06d3328f411df3dff2150a00e595", checkPending: true),
            byAddr: nil,
            unconfirmedByAddr: nil,
            byBlk: nil
        ))
        print(response.total)
    }
}
