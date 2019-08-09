//
//  File.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/9.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public struct SolidityTuple: ABIEncodable {
    
    var values: [SolidityWrappedValue]
    
    public init(_ values: SolidityWrappedValue...) {
        self.values = values
    }
    
    public init(_ values: [SolidityWrappedValue]) {
        self.values = values
    }
    
    public func abiEncode(dynamic: Bool) -> String? {
        return try? ABIEncoder.encode(values)
    }
}
