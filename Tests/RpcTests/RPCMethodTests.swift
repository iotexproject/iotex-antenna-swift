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
        let rpc = try RPCMethod(provider: "api.testnet.iotex.one:443", secure: true)
        let response = try rpc.getAccount(Iotexapi_GetAccountRequest.with {
            $0.address = "io126xcrjhtp27end76ac9nmx6px2072c3vgz6suw"
        })
        XCTAssert(response.accountMeta.address == "io126xcrjhtp27end76ac9nmx6px2072c3vgz6suw")
        print(response)
    }

    func testGetActionsByIndex() throws {
        let rpc = try RPCMethod(provider: "api.testnet.iotex.one:443", secure: true)
        let response = try rpc.getActions(Iotexapi_GetActionsRequest.with {
            $0.byIndex = Iotexapi_GetActionsByIndexRequest.with {
                $0.start = 100
                $0.count = 10
            }
        })
        print(response.actionInfo[0].actHash)
    }

    func testGetActionsByHash() throws {
        let rpc = try RPCMethod(provider: "api.testnet.iotex.one:443", secure: true)
        let response = try rpc.getActions(Iotexapi_GetActionsRequest.with {
            $0.byHash = Iotexapi_GetActionByHashRequest.with {
                $0.actionHash = "1c9b40a3d945871521f4f1103d5e3f1736eb06d3328f411df3dff2150a00e595"
                $0.checkPending = true
            }
        })
        print(response)
    }
}
