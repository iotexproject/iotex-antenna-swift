//
//  Keystore.swift
//  iotex-swift
//
//  Created by ququzone on 2019/8/1.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public struct Keystore: Codable {
    public init(account: Account, password: String) throws {
        self = try KeystoreFactory.keystore(from: account, password: password)
    }
    
    public func account(password: String) throws -> Account {
        return try KeystoreFactory.account(from: self, password: password)
    }
    
    init(version: Int, id: String, address: String, crypto: Crypto) {
        self.version = version
        self.id = id
        self.address = address
        self.crypto = crypto
    }
    
    public let version: Int
    
    public let id: String
    
    public let address: String
    
    public let crypto: Crypto
    
    public struct Crypto: Codable {
        
        public let ciphertext: String
        
        public let cipherparams: Cipherparams
        
        public struct Cipherparams: Codable {
            
            public let iv: String
        }
        
        public let cipher: String
        
        public let kdf: KDFType
        
        public enum KDFType: String, Codable {
            
            case scrypt
            case pbkdf2
        }
        
        public let kdfparams: KDFParams
        
        public struct KDFParams: Codable {
            
            public let salt: String
            
            public let dklen: Int
            
            // *** Scrypt params ***
            public let n: Int?
            
            public let r: Int?
            
            public let p: Int?
            
            // *** End Scrypt params ***
            // *** PBKDF2 params ***
            public let prf: String?
            
            public let c: Int?
            
            // *** End PBKDF2 params ***
            /// Scrypt init
            init(salt: String, dklen: Int, n: Int, r: Int, p: Int) {
                self.salt = salt
                self.dklen = dklen
                self.n = n
                self.r = r
                self.p = p
                self.prf = nil
                self.c = nil
            }
            
            /// PBKDF2 init
            init(salt: String, dklen: Int, prf: String, c: Int) {
                self.salt = salt
                self.dklen = dklen
                self.prf = prf
                self.c = c
                self.n = nil
                self.r = nil
                self.p = nil
            }
        }
        
        public let mac: String
    }
    
    public enum CodingKeys: String, CodingKey {
        
        case version
        
        case id
        
        case address
        
        case crypto
        
        case oldCrypto = "Crypto"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let version = try (try? container.decode(Int.self, forKey: .version)) ?? Int(container.decode(String.self, forKey: .version)) ?? container.decode(Int.self, forKey: .version)
        let id = try container.decode(String.self, forKey: .id)
        let address = try container.decode(String.self, forKey: .address)
        
        let crypto = try container.decodeIfPresent(Crypto.self, forKey: .crypto) ?? container.decode(Crypto.self, forKey: .oldCrypto)
        
        self.init(version: version, id: id, address: address, crypto: crypto)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(version, forKey: .version)
        try container.encode(id, forKey: .id)
        try container.encode(address, forKey: .address)
        try container.encode(crypto, forKey: .crypto)
    }
}
