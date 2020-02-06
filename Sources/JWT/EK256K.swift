//
//  EK256K.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/12/19.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class EK256K: NSObject {
    private static let header = "{\"alg\":\"EK256K\",\"typ\":\"JWT\"}"
    
    public enum Error: Swift.Error {
        case invalidToken
        case errorAlg
    }
    
    @objc public static func sign(payloadJson: String, secret: String) throws -> String {
        let account = try Account.create(privateKey: secret)
        
        let headerBase = header.bytes.toSafeBase64()!
        let payloadBase = payloadJson.bytes.toBase64()!
        let signature = try account.sign(message: (headerBase + "." + payloadBase).bytes)
        let signatureBase = signature.toSafeBase64()!
        
        return headerBase + "." + payloadBase + "." + signatureBase
    }
    
    @objc public static func verify(token: String) throws -> String {
        let segments = token.split(separator: ".")
        
        if segments.count != 3 {
            throw Error.invalidToken
        }
        
        let headerDictionary = try JSONSerialization.jsonObject(with: Data(Bytes(safeBase64: String(segments[0]))), options: []) as! [String: Any]
        
        guard let alg = headerDictionary["alg"] as? String else { throw Error.errorAlg }
        if alg != "EK256K" {
            throw Error.errorAlg
        }
        
        let payload = Data(Bytes(safeBase64: String(segments[1])))
        let payloadDictionary = try JSONSerialization.jsonObject(with: payload, options: []) as! [String: Any]
        let signature = Bytes(safeBase64: String(segments[2]))
        
        let empty = try Account.create()
        let recoveredAddress = try empty.recover(signature: signature, message: (String(segments[0]) + "." + String(segments[1])).bytes)
        
        guard let secretOrPublicKey = payloadDictionary["iss"] as? String else { throw Error.invalidToken }
        let expectedAddress = try Account.publicKeyToAddress(publicKey: secretOrPublicKey)
        if (recoveredAddress != expectedAddress) {
            throw Error.invalidToken
        }
        
        return String(data: payload, encoding: .utf8)!
    }
}
