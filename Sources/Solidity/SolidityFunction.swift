//
//  SolidityFunction.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/9.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public protocol SolidityParameter {
    var name: String { get }
    var type: SolidityType { get }
    var components: [SolidityParameter]? { get }
}

/// Represents a value that can be passed into a function or is returned from a function
public struct SolidityFunctionParameter: SolidityParameter {
    public let name: String
    public let type: SolidityType
    public let components: [SolidityParameter]?
    
    public init?(_ parameter: ABIObject.Parameter) {
        self.name = parameter.name
        let components = parameter.components?.compactMap { SolidityFunctionParameter($0) }
        let subTypes = components?.map { $0.type }
        guard let type = SolidityType(parameter.type, subTypes: subTypes) else { return nil }
        self.type = type
        self.components = components
    }
    
    public init(name: String, type: SolidityType, components: [SolidityFunctionParameter]? = nil) {
        self.name = name
        self.type = type
        self.components = components
    }
}

/// Represents a function within a contract
public protocol SolidityFunction: class {
    
    /// Name of the method. Must match the contract source.
    var name: String { get }
    
    /// Values accepted by the function
    var inputs: [SolidityFunctionParameter] { get }
    
    /// Values returned by the function
    var outputs: [SolidityFunctionParameter]? { get }
    
    /// Signature of the function. Used to identify which function you are calling.
    var signature: String { get }
    
    init?(abiObject: ABIObject)
    init(name: String, inputs: [SolidityFunctionParameter], outputs: [SolidityFunctionParameter]?)
}

public extension SolidityFunction {
    
    var signature: String {
        return "\(name)(\(inputs.map { $0.type.stringValue }.joined(separator: ",")))"
    }
    
}

// MARK: - Function Implementations
/// Represents a function that is read-only. It will not modify state on the blockchain.
public class SolidityConstantFunction: SolidityFunction {
    public let name: String
    public let inputs: [SolidityFunctionParameter]
    public let outputs: [SolidityFunctionParameter]?
    
    public required init?(abiObject: ABIObject) {
        guard abiObject.type == .function, abiObject.stateMutability?.isConstant == true else { return nil }
        guard let name = abiObject.name else { return nil }
        self.name = name
        self.inputs = abiObject.inputs?.compactMap { SolidityFunctionParameter($0) } ?? []
        self.outputs = abiObject.outputs?.compactMap { SolidityFunctionParameter($0) }
    }
    
    public required init(name: String, inputs: [SolidityFunctionParameter] = [], outputs: [SolidityFunctionParameter]?) {
        self.name = name
        self.inputs = inputs
        self.outputs = outputs
    }
}

/// Represents a function that can modify the state of the contract and can accept ETH.
public class SolidityPayableFunction: SolidityFunction {
    public let name: String
    public let inputs: [SolidityFunctionParameter]
    public let outputs: [SolidityFunctionParameter]? = nil
    
    public required init?(abiObject: ABIObject) {
        guard abiObject.type == .function, abiObject.stateMutability == .payable else { return nil }
        guard let name = abiObject.name else { return nil }
        self.name = name
        self.inputs = abiObject.inputs?.compactMap { SolidityFunctionParameter($0) } ?? []
    }
    
    public required init(name: String, inputs: [SolidityFunctionParameter] = [], outputs: [SolidityFunctionParameter]? = nil) {
        self.name = name
        self.inputs = inputs
    }
}

/// Represents a function that can modify the state of the contract and cannot accept ETH.
public class SolidityNonPayableFunction: SolidityFunction {
    public let name: String
    public let inputs: [SolidityFunctionParameter]
    public let outputs: [SolidityFunctionParameter]? = nil
    
    public required init?(abiObject: ABIObject) {
        guard abiObject.type == .function, abiObject.stateMutability == .nonpayable else { return nil }
        guard let name = abiObject.name else { return nil }
        self.name = name
        self.inputs = abiObject.inputs?.compactMap { SolidityFunctionParameter($0) } ?? []
    }
    
    public required init(name: String, inputs: [SolidityFunctionParameter] = [], outputs: [SolidityFunctionParameter]? = nil) {
        self.name = name
        self.inputs = inputs
    }
}

/// Represents a function that creates a contract
public class SolidityConstructor {
    public let inputs: [SolidityFunctionParameter]
    public let payable: Bool
    
    public init?(abiObject: ABIObject) {
        guard abiObject.type == .constructor else { return nil }
        self.inputs = abiObject.inputs?.compactMap { SolidityFunctionParameter($0) } ?? []
        self.payable = abiObject.payable ?? false
    }
    
    public init(inputs: [SolidityFunctionParameter], payable: Bool = false) {
        self.inputs = inputs
        self.payable = payable
    }
}
