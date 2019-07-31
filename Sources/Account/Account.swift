//
//  Account.swift
//  IoTex.swift
//
//  Created by ququzone on 2019/7/31.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class Account {
    public let privateKey: String
    
    public init(privateKey: String) {
        self.privateKey = privateKey;
    }
    
    public var publicKey: String {
        let publicKeyData = Secp256k1.createPublicKey(from: Data(fromHexEncodedString: privateKey)!)
        return publicKeyData.hexEncodedString()
    }
    
    public var address: String {
        return "TODO"
    }
}
