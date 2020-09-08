//
//  Bip32.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2020/9/8.
//  Copyright © 2020 IoTeX. All rights reserved.
//

import Foundation
import CryptoSwift

public class BIP32 {
    static public func generatePrivateKey(seed: Data) -> String?  {
        guard seed.count >= 16 else {
            return nil
        }
        let hmacKey = "Bitcoin seed".data(using: .ascii)!
        let hmac:Authenticator = HMAC(key: hmacKey.bytes, variant: HMAC.Variant.sha512)
        guard let entropy = try? hmac.authenticate(seed.bytes) else { return nil }
        guard entropy.count == 64 else { return nil }
        let I_L = entropy[0..<32]
        return Data(I_L).hexString
    }
}
