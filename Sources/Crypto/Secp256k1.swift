//
//  Secp256k1.swift
//  iotex-swift
//
//  Created by ququzone on 2019/7/31.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation
import secp256k1

public class Secp256k1 {
    public class func sign(message: Bytes, seckey: Bytes) -> (Bytes?, Int32) {
        let context = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY))!
        defer {
            secp256k1_context_destroy(context)
        }

        if secp256k1_ec_seckey_verify(context, seckey) != 1 {
            return (nil, 0)
        }

        var sig = secp256k1_ecdsa_recoverable_signature()
        if secp256k1_ecdsa_sign_recoverable(context, &sig, Array(message), seckey, secp256k1_nonce_function_rfc6979, nil) == 0 {
            return (nil, 0)
        }

        var data = [UInt8](repeating: 0, count: 64)
        var recid: Int32 = 0
        secp256k1_ecdsa_recoverable_signature_serialize_compact(context, &data, &recid, &sig)

        return (data, recid)
    }

    public class func verify(seckey: Bytes) -> Bool {
        let context = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_VERIFY))!
        defer {
            secp256k1_context_destroy(context)
        }

        return seckey.count == 32 && secp256k1_ec_seckey_verify(context, seckey) == 1
    }

    public class func createPublicKey(from seckey: Bytes, compressed: Bool = false) -> Bytes {
        let context = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN))!
        defer {
            secp256k1_context_destroy(context)
        }

        var publicKey = secp256k1_pubkey()
        _ = secp256k1_ec_pubkey_create(context, &publicKey, seckey)

        var length = compressed ? 33 : 65
        var data = [UInt8](repeating: 0, count: length)

        let flag = compressed ? UInt32(SECP256K1_EC_COMPRESSED) : UInt32(SECP256K1_EC_UNCOMPRESSED)
        _ = secp256k1_ec_pubkey_serialize(context, &data, &length, &publicKey, flag)

        return data
    }
    
    public class func recovery(signature: Bytes, message: Bytes) -> Bytes {
        let context = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY))!
        defer {
            secp256k1_context_destroy(context)
        }
        
        var publicKey = secp256k1_pubkey()
        var sign = secp256k1_ecdsa_recoverable_signature()
        let recid = Int32(signature[64])
        Data(signature).withUnsafeBytes { (input: UnsafePointer<UInt8>) -> Void in
            secp256k1_ecdsa_recoverable_signature_parse_compact(context, &sign, input, recid)
        }
        
        _ = secp256k1_ecdsa_recover(context, &publicKey, &sign, message)
        
        var length = 65
        var data = [UInt8](repeating: 0, count: length)
        
        let flag = UInt32(SECP256K1_EC_UNCOMPRESSED)
        _ = secp256k1_ec_pubkey_serialize(context, &data, &length, &publicKey, flag)
        
        return data
    }
}
