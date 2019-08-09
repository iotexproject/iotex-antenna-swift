//

//  File.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/9.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation
import BigInt

/// ABI Namespace
public struct ABI {
    
    enum Error: Swift.Error {
        case unknownError
        case notImplemented
    }
    
    // MARK: - Encoding
    
    public static func encodeFunctionSignature(_ function: SolidityFunction) -> String {
        return String(function.signature.sha3(.keccak256).prefix(8))
    }
    
    public static func encodeEventSignature(_ event: SolidityEvent) -> String {
        return event.signature.sha3(.keccak256)
    }
    
    public static func encodeParameter(type: SolidityType, value: ABIEncodable) throws -> String {
        return try ABIEncoder.encode(value, to: type)
    }
    
    public static func encodeParameter(_ wrappedValue: SolidityWrappedValue) throws -> String {
        return try ABIEncoder.encode(wrappedValue)
    }
    
    public static func encodeParameters(types: [SolidityType], values: [ABIEncodable]) throws -> String {
        let wrappedValues = zip(types, values).map { SolidityWrappedValue(value: $0.1, type: $0.0) }
        return try encodeParameters(wrappedValues)
    }
    
    public static func encodeParameters(_ wrappedValues: [SolidityWrappedValue]) throws -> String {
        return try ABIEncoder.encode(wrappedValues)
    }
    
    // MARK: - Decoding
    
    public static func decodeParameter(type: SolidityType, from hexString: String) throws -> Any {
        return try ABIDecoder.decode(type, from: hexString)
    }
    
    public static func decodeParameters(types: [SolidityType], from hexString: String ) throws -> [Any] {
        return try ABIDecoder.decode(types, from: hexString)
    }
    
    public static func decodeParameters(_ outputs: [SolidityParameter], from hexString: String) throws -> [String: Any] {
        return try ABIDecoder.decode(outputs: outputs, from: hexString)
    }
}
