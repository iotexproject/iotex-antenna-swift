//
//  Account.swift
//  iotex-swift
//
//  Created by ququzone on 2019/7/31.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation
import CryptoSwift

public class Account: NSObject {
    @objc public let privateKey: String
    @objc public let publicKey: String
    @objc public let address: String
    
    @objc public class func create() throws -> Account {
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
    @objc public class func create(privateKey: String) throws -> Account {
        return try Account(privateKey: privateKey)
    }
    
    @objc public class func publicKeyToAddress(publicKey: String) throws -> String {
        var publicBytes = publicKey.hexToBytes()
        publicBytes.removeFirst()
        var pubHash = SHA3(variant: .keccak256).calculate(for: publicBytes)
        guard pubHash.count == 32 else {
            throw Error.internalError
        }
        pubHash = Array(pubHash[12...])
        let bech32 = Bech32()
        let grouped = try bech32.convertBits(from: 8, to: 5, pad: true, idata: Data(bytes: pubHash, count: 20))
        return bech32.encode("io", values: grouped)
    }

    @objc public init(privateKey: String) throws {
        self.privateKey = privateKey;
        var publicKey = Secp256k1.createPublicKey(from: try self.privateKey.hexBytes())
        self.publicKey = publicKey.hexString()
        publicKey.removeFirst()
        var pubHash = SHA3(variant: .keccak256).calculate(for: publicKey)
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
    
    @objc public func sign(message: Bytes) throws -> Bytes {
        let hash = try hashMessage(message: message)
        
        var (data, rid) = Secp256k1.sign(message: hash, seckey: try self.privateKey.hexBytes())
        if (data == nil) {
            throw Error.signatureMalformed
        }
        data!.append(UInt8(rid))
        return data!
    }
    
    @objc public func hashMessage(message: Bytes) throws -> Bytes {
        let preambleTemp = "IoTeX Signed Message:\n%d"
        let preamble = String(format: preambleTemp, message.count)
        
        var bytes = Bytes()
        bytes.append(22)
        bytes.append(contentsOf: preamble.bytes)
        bytes.append(contentsOf: message)
        
        let hash = SHA3(variant: .keccak256).calculate(for: bytes)
        guard hash.count == 32 else {
            throw Error.internalError
        }
        
        return hash
    }
    
    @objc public func recover(signature: Bytes, message: Bytes) throws -> String {
        let hash = try hashMessage(message: message)
        
        var publicKey = Secp256k1.recovery(signature: signature, message: hash)
        
        publicKey.removeFirst()
        var pubHash = SHA3(variant: .keccak256).calculate(for: publicKey)
        guard pubHash.count == 32 else {
            throw Error.internalError
        }
        pubHash = Array(pubHash[12...])
        let bech32 = Bech32()
        let grouped = try bech32.convertBits(from: 8, to: 5, pad: true, idata: Data(bytes: pubHash, count: 20))
        return bech32.encode("io", values: grouped)
    }
}
