//
//  File.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/9.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public class Contract {
    private let provider: RPCMethod
    private let address: String
    private let abi: [ABIObject]
    
    public enum Error: Swift.Error {
        case methodNotFound
    }
    
    public init(provider: RPCMethod, address: String, abi: Data) throws {
        self.provider = provider
        self.address = address
        let decoder = JSONDecoder()
        self.abi = try decoder.decode([ABIObject].self, from: abi)
    }

    public func execute(nonce: UInt64?, gasLimit: UInt64, gasPrice: String, account: Account,
                        method: String, amount: String, inputs: [ABIEncodable]) throws -> String {
        var methodObject: ABIObject?
        for abiObject in self.abi {
            if (abiObject.name != nil && abiObject.name == method) {
                methodObject = abiObject
                break
            }
        }
        if (methodObject == nil) {
            throw Error.methodNotFound
        }

        let function = SolidityNormalFunction(abiObject: methodObject!)!
        let parameters = zip(inputs, function.inputs).map { SolidityWrappedValue(value: $0, type: $1.type) }
        let data = try ABI.encodeFunctionCall(method: function, parameters: parameters)
        
        return try ExecutionMethod(client: self.provider,
                        request: ExecutionRequest(
                            nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account,
                            contract: self.address, amount: amount,
                            data: Data(data.hexBytes()))).execute();
    }

    public func read(callerAddress: String, method: String, inputs: [ABIEncodable]) throws -> [Any] {
        var methodObject: ABIObject?
        for abiObject in self.abi {
            if (abiObject.name != nil && abiObject.name == method) {
                methodObject = abiObject
                break
            }
        }
        if (methodObject == nil) {
            throw Error.methodNotFound
        }

        let function = SolidityConstantFunction(abiObject: methodObject!)!
        let parameters = zip(inputs, function.inputs).map { SolidityWrappedValue(value: $0, type: $1.type) }
        let data = try ABI.encodeFunctionCall(method: function, parameters: parameters)
        
        let result = try self.provider.readContract(Iotexapi_ReadContractRequest.with {
            $0.callerAddress = callerAddress
            $0.execution = try Iotextypes_Execution.with {
                $0.contract = self.address
                $0.amount = "0"
                $0.data = Data(try data.hexBytes())
            }
        }).data

        let outputs = function.outputs?.compactMap { i in return i.type }
        return try ABI.decodeParameters(types: outputs!, from: result)
    }
}
