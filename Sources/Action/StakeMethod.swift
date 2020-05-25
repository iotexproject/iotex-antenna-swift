//
//  StakeMethod.swift
//  iotex-antenna-swift
//
//  Created by tianlan on 2020/5/25.
//  Copyright © 2020 IoTeX. All rights reserved.
//

import UIKit

class StakeMethod: AbstractMethod {
    private var request: TransferRequest
    private var envelop: Envelop?
    
    public init(client: RPCMethod, request: TransferRequest) throws {
        self.request = request
        self.envelop = nil
        super.init(client: client, account: request.account)
        self.envelop = try self.baseEnvelop(request)
    }
    
    public func execute() throws -> String {
        self.envelop!.transfer = Iotextypes_Transfer.with {
            $0.recipient = self.request.recipient
            $0.amount = self.request.amount
            $0.payload = self.request.payload
        }
        return try self.sendAction(envelop: self.envelop!)
    }
    
    func create(candidateName: String, stakedDuration: UInt32, autoStake: Bool = false, stakedAmount: String) throws -> String {
        self.envelop!.stakeCreate = Iotextypes_StakeCreate.with{
            $0.candidateName = candidateName
            $0.stakedDuration = stakedDuration
            $0.autoStake = autoStake
            $0.stakedAmount = stakedAmount
        }
        return try self.sendAction(envelop: self.envelop!)
    }
    
    func unsteke(bucketIndex: UInt64) throws -> String {
        self.envelop!.stakeUnstake = Iotextypes_StakeReclaim.with{
            $0.bucketIndex = bucketIndex
        }
        return try self.sendAction(envelop: self.envelop!)
    }
    
    func withdraw(bucketIndex: UInt64) throws -> String {
        self.envelop!.stakeWithdraw = Iotextypes_StakeReclaim.with{
            $0.bucketIndex = bucketIndex
        }
        return try self.sendAction(envelop: self.envelop!)
    }
    
    func addDeposit(bucketIndex: UInt64, amount: String) throws -> String {
        self.envelop!.stakeAddDeposit = Iotextypes_StakeAddDeposit.with{
            $0.bucketIndex = bucketIndex
            $0.amount = amount
        }
        return try self.sendAction(envelop: self.envelop!)
    }
    
    func restake(bucketIndex: UInt64, stakedDuration: UInt32, autoStake: Bool = false) throws -> String {
        self.envelop!.stakeRestake = Iotextypes_StakeRestake.with{
            $0.bucketIndex = bucketIndex
            $0.stakedDuration = stakedDuration
            $0.autoStake = autoStake
        }
        return try self.sendAction(envelop: self.envelop!)
    }
    
    func changeCandidate(bucketIndex: UInt64, candidateName: String) throws -> String{
        self.envelop!.stakeChangeCandidate = Iotextypes_StakeChangeCandidate.with{
            $0.candidateName = candidateName
            $0.bucketIndex = bucketIndex
        }
        return try self.sendAction(envelop: self.envelop!)
    }
    
    func stakingTransfer(bucketIndex: UInt64, voterAddress: String) throws -> String {
        self.envelop!.stakeTransferOwnership = Iotextypes_StakeTransferOwnership.with {
            $0.voterAddress = voterAddress
            $0.bucketIndex = bucketIndex
        }
        return try self.sendAction(envelop: self.envelop!)
    }
    
    func register(ownerAddress:String, stakedAmount: String, autoStake: Bool = false, stakedDuration: UInt32) throws -> String {
        self.envelop!.candidateRegister = Iotextypes_CandidateRegister.with {
            $0.ownerAddress = ownerAddress
            $0.stakedAmount = stakedAmount
            $0.autoStake = autoStake
            $0.stakedDuration = stakedDuration
        }
        return try self.sendAction(envelop: self.envelop!)
    }
    
    func update(name: String, rewardAddress: String, operatorAddress: String) throws -> String {
        self.envelop!.candidateUpdate = Iotextypes_CandidateBasicInfo.with {
            $0.name = name
            $0.rewardAddress = rewardAddress
            $0.operatorAddress = operatorAddress
        }
        return try self.sendAction(envelop: self.envelop!)
    }
}
