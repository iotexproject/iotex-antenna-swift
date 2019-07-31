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
    public class func sign(message: Data, seckey: Data) -> (Data?, Int32) {
        let context = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY))!
        defer {
            secp256k1_context_destroy(context)
        }

        let seckeyData = Array(seckey)

        if secp256k1_ec_seckey_verify(context, seckeyData) != 1 {
            return (nil, 0)
        }

        var sig = secp256k1_ecdsa_recoverable_signature()
        if secp256k1_ecdsa_sign_recoverable(context, &sig, Array(message), seckeyData, secp256k1_nonce_function_rfc6979, nil) == 0 {
            return (nil, 0)
        }

        var data = [UInt8](repeating: 0, count: 64)
        var recid: Int32 = 0
        secp256k1_ecdsa_recoverable_signature_serialize_compact(context, &data, &recid, &sig)

        return (Data(bytes: data, count: 64), recid)
    }

    public class func verify(seckey: Data) -> Bool {
        let context = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_VERIFY))!
        defer {
            secp256k1_context_destroy(context)
        }

        let seckeyData = Array(seckey)
        return seckeyData.count == 32 && secp256k1_ec_seckey_verify(context, seckeyData) == 1
    }

    public class func createPublicKey(from seckey: Data, compressed: Bool = false) -> Data {
        let context = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN))!
        defer {
            secp256k1_context_destroy(context)
        }

        let seckeyData = Array(seckey)
        var publicKey = secp256k1_pubkey()
        _ = secp256k1_ec_pubkey_create(context, &publicKey, seckeyData)

        var length = compressed ? 33 : 65
        var data = [UInt8](repeating: 0, count: length)

        let flag = compressed ? UInt32(SECP256K1_EC_COMPRESSED) : UInt32(SECP256K1_EC_UNCOMPRESSED)
        _ = secp256k1_ec_pubkey_serialize(context, &data, &length, &publicKey, flag)

        return Data(bytes: data, count: length)
    }
}
