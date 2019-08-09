//
//  Address.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/9.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public struct Address {
    public let bytes: Bytes
    public let string: String
    
    public init(payload: Bytes) {
        self.bytes = payload
        let bech32 = Bech32()
        let grouped = try! bech32.convertBits(from: 8, to: 5, pad: true, idata: Data(bytes: bytes, count: 20))
        self.string = bech32.encode("io", values: grouped)
    }
    
    public init(address: String) {
        self.string = address
        let bech32 = Bech32()
        let (_, checksum) = try! bech32.decode(address)
        self.bytes = try! bech32.convertBits(from: 5, to: 8, pad: false, idata: checksum).makeBytes()
    }
}
