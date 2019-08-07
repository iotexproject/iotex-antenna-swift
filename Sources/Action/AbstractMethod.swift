//
//  AbstractMethod.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/7.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class AbstractMethod {
    var client: RPCMethod
    var account: Account
    
    public init(client: RPCMethod, account: Account) {
        self.client = client
        self.account = account
    }
}
