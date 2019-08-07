//
//  SealedEnvelop.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/7.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation
import CryptoSwift

public struct SealedEnvelop {
    private var act: Envelop
    private var senderPubKey: Data
    private var signature: Data
    
    public init(privateKey: Bytes, publicKey: Bytes, envelop: Envelop) throws {
        self.act = envelop
        
        let signatureData = try SHA3(variant: .keccak256).calculate(for: envelop.byteStream().makeBytes())
        var (data, rid) = Secp256k1.sign(message: signatureData, seckey: privateKey)
        if (data == nil) {
            throw Error.signatureMalformed
        }
        data!.append(UInt8(rid))
        
        self.senderPubKey = Data(publicKey)
        self.signature = Data(data!)
    }
    
    public enum Error: Swift.Error {
        case signatureMalformed
    }
    
    public func action() -> Iotextypes_Action {
        var action = Iotextypes_Action()
        
        action.core = self.act.core()
        action.senderPubKey = self.senderPubKey
        action.signature = self.signature
        
        return action
    }
    
    public func byteStream() throws -> Data {
        return try self.action().serializedData()
    }

    public func hash() throws -> String {
        return try SHA3(variant: .keccak256).calculate(for: byteStream().makeBytes()).hexString()
    }
}
