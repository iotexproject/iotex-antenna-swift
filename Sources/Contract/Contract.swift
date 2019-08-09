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
            }
        }
        if (methodObject == nil) {
            throw Error.methodNotFound
        }
        var function: SolidityFunction
        if (methodObject!.payable != nil && methodObject!.payable!) {
            function = SolidityPayableFunction(abiObject: methodObject!)!
        } else {
            function = SolidityNonPayableFunction(abiObject: methodObject!)!
        }
        let parameters = zip(inputs, function.inputs).map { SolidityWrappedValue(value: $0, type: $1.type) }
        let data = try ABI.encodeFunctionCall(method: function, parameters: parameters)
        
        return try ExecutionMethod(client: self.provider,
                        request: ExecutionRequest(
                            nonce: nonce, gasLimit: gasLimit, gasPrice: gasPrice, account: account,
                            contract: self.address, amount: amount,
                            data: Data(data.hexBytes()))).execute();
    }
}
