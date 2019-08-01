//
//  KeystoreFactory.swift
//  iotex-swift
//
//  Created by ququzone on 2019/8/1.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

import CryptoSwift

public struct KeystoreFactory {
    public static func account(from keystore: Keystore, password: String) throws -> Account {
        let key = try deriveKey(password: password, kdf: keystore.crypto.kdf, kdfparams: keystore.crypto.kdfparams)
        
        guard key.count >= 32 else {
            throw Error.kdfFailed
        }
        
        let ivData = try keystore.crypto.cipherparams.iv.dataWithHexString()
        let ciphertextData = try keystore.crypto.ciphertext.dataWithHexString()
        let cipher = keystore.crypto.cipher
        
        var macContent = key[16..<32]
        macContent.append(ciphertextData)
        let mac = Data(SHA3(variant: .keccak256).calculate(for: Bytes(macContent)))
        
        guard mac.hexString == keystore.crypto.mac else {
            throw Error.passwordWrong
        }
        
        let usableKey: Data
        if keystore.version == 1 {
            usableKey = Data(SHA3(variant: .keccak256).calculate(for: Bytes(key[0..<16])))[0..<16]
        } else {
            usableKey = key[0..<16]
        }
        
        let splittedCipher = cipher.split(separator: "-")
        guard splittedCipher.count == 3, splittedCipher[0] == "aes", splittedCipher[1] == "128" else {
            throw Error.cipherNotAvailable
        }
        guard let blockmode = IVBlockModeType(rawValue: splittedCipher[2].lowercased())?.blockMode(iv: Bytes(ivData)) else {
            throw Error.cipherNotAvailable
        }
        
        let aes = try AES(key: Bytes(usableKey), blockMode: blockmode, padding: .pkcs7)
        
        let privateKey = try aes.decrypt(Bytes(ciphertextData))
        return try Account.create(privateKey: privateKey.hexString())
    }

    public static func keystore(from account: Account, password: String, kdf: Keystore.Crypto.KDFType = .scrypt, cipher: IVBlockModeType = .ctr) throws -> Keystore {
        guard let iv = Bytes.secureRandom(count: 16), let salt = Bytes.secureRandom(count: 32) else {
            throw Error.bytesGenerationFailed
        }
        
        let kdfparams: Keystore.Crypto.KDFParams
        switch kdf {
        case .scrypt:
            kdfparams = Keystore.Crypto.KDFParams(salt: Data(salt).hexString, dklen: 32, n: 8192, r: 8, p: 1)
        case .pbkdf2:
            kdfparams = Keystore.Crypto.KDFParams(salt: Data(salt).hexString, dklen: 32, prf: "hmac-sha256", c: 8192)
        }
        
        let key = try deriveKey(password: password, kdf: kdf, kdfparams: kdfparams)
        guard key.count >= 32 else {
            throw Error.kdfFailed
        }
        let usableKey = key[0..<16]
        
        let blockMode = cipher.blockMode(iv: iv)
        let aes = try AES(key: Bytes(usableKey), blockMode: blockMode, padding: .pkcs7)
        
        let ciphertextData = try Data(aes.encrypt(account.privateKey.hexBytes()))
        let ciphertext = ciphertextData.hexString
        
        var macContent = key[16..<32]
        macContent.append(ciphertextData)
        let mac = Data(SHA3(variant: .keccak256).calculate(for: Bytes(macContent)))
        
        let cipherparams = Keystore.Crypto.Cipherparams(iv: Data(iv).hexString)
        let crypto = Keystore.Crypto(ciphertext: ciphertext, cipherparams: cipherparams, cipher: "aes-128-\(cipher.rawValue)", kdf: kdf, kdfparams: kdfparams, mac: Data(mac).hexString)
        
        return Keystore(version: 3, id: UUID().uuidString.lowercased(), address: account.address, crypto: crypto)
    }
    
    private static func deriveKey(password: String, kdf: Keystore.Crypto.KDFType, kdfparams: Keystore.Crypto.KDFParams) throws -> Data {
        guard let passwordData = password.data(using: .utf8) else {
            throw Error.passwordMalformed
        }
        let saltData = try kdfparams.salt.dataWithHexString()
        
        if kdf == .scrypt {
            guard let n = kdfparams.n, let r = kdfparams.r, let p = kdfparams.p else {
                throw Error.kdfInputsMalformed
            }
            
            let params = try ScryptParams(salt: saltData, n: n, r: r, p: p, desiredKeyLength: kdfparams.dklen)
            return try Scrypt(params: params).calculate(password: password)
        }
        
        // PBKDF2
        guard kdf == .pbkdf2 && kdfparams.prf == "hmac-sha256" else {
            throw Error.kdfInputsMalformed
        }
        guard let c = kdfparams.c, c > 0 else {
            throw Error.kdfInputsMalformed
        }
        
        return try Data(PKCS5.PBKDF2(password: Bytes(passwordData), salt: Bytes(saltData), iterations: c, keyLength: kdfparams.dklen, variant: .sha256).calculate())
    }
    
    public enum Error: Swift.Error {
        
        /// The password can't be represented as utf8 data
        case passwordMalformed
        
        /// The keystore contains values which are not acceptable or misses some values which are needed
        case keystoreMalformed
        
        /// The kdf values in the keystore are missing values/are not available
        case kdfInputsMalformed
        
        /// The kdf failed at any point
        case kdfFailed
        
        /// The password is wrong/mac verification failed
        case passwordWrong
        
        /// The given cipher is not available
        case cipherNotAvailable
        
        /// Generating random bytes failed
        case bytesGenerationFailed
        
        /// The given private key is not a valid secp256k1 private key
        case privateKeyMalformed
    }
}

public enum IVBlockModeType: String {
    
    case cbc
    case cfb
    case ctr
    case ofb
    case pcbc
    
    public func blockMode(iv: Bytes) -> BlockMode {
        switch self {
        case .cbc:
            return CBC(iv: iv)
        case .cfb:
            return CFB(iv: iv)
        case .ctr:
            return CTR(iv: iv)
        case .ofb:
            return OFB(iv: iv)
        case .pcbc:
            return OFB(iv: iv)
        }
    }
}

