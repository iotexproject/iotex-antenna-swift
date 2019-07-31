//
//  Account.swift
//  iotex-swift
//
//  Created by ququzone on 2019/7/31.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation
import CryptoSwift

public class Account {
    public let privateKey: String
    public let publicKey: String
    public let address: String
    
    public class func create() throws -> Account {
        guard var rand = Bytes.secureRandom(count: 2)?.bigEndianUInt else {
            throw Error.internalError
        }
        rand += 55
        
        guard let bytes = Bytes.secureRandom(count: Int(rand)) else {
            throw Error.internalError
        }
        let bytesHash = SHA3(variant: .keccak256).calculate(for: bytes)
        
        return try Account(privateKey: bytesHash.hexString())
    }

    public init(privateKey: String) throws {
        self.privateKey = privateKey;
        var publicKeyData = Secp256k1.createPublicKey(from: Data(fromHexEncodedString: privateKey)!)
        self.publicKey = publicKeyData.hexEncodedString()
        publicKeyData.removeFirst()
        var pubHash = SHA3(variant: .keccak256).calculate(for: Array(publicKeyData))
        guard pubHash.count == 32 else {
            throw Error.internalError
        }
        pubHash = Array(pubHash[12...])
        let bech32 = Bech32()
        let grouped = try bech32.convertBits(from: 8, to: 5, pad: true, idata: Data(bytes: pubHash, count: 20))
        self.address = bech32.encode("io", values: grouped)
    }

    public enum Error: Swift.Error {
        case internalError
        case keyMalformed
        case signatureMalformed
    }
}
