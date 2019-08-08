//
//  Envelop.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2019/8/7.
//  Copyright © 2019 IoTeX. All rights reserved.
//

import Foundation

public struct Envelop {
    public var version: UInt32
    public var nonce: UInt64
    public var gasLimit: UInt64
    public var gasPrice: String
    
    // optional fields
    public var transfer: Iotextypes_Transfer?
    public var execution: Iotextypes_Execution?
    public var startSubChain: Iotextypes_StartSubChain?
    public var stopSubChain: Iotextypes_StopSubChain?
    public var putBlock: Iotextypes_PutBlock?
    public var createDeposit: Iotextypes_CreateDeposit?
    public var settleDeposit: Iotextypes_SettleDeposit?
    public var createPlumChain: Iotextypes_CreatePlumChain?
    public var terminatePlumChain: Iotextypes_TerminatePlumChain?
    public var plumPutBlock: Iotextypes_PlumPutBlock?
    public var plumCreateDeposit: Iotextypes_PlumCreateDeposit?
    public var plumStartExit: Iotextypes_PlumStartExit?
    public var plumChallengeExit: Iotextypes_PlumChallengeExit?
    public var plumResponseChallengeExit: Iotextypes_PlumResponseChallengeExit?
    public var plumFinalizeExit: Iotextypes_PlumFinalizeExit?
    public var plumSettleDeposit: Iotextypes_PlumSettleDeposit?
    public var plumTransfer: Iotextypes_PlumTransfer?
    public var depositToRewardingFund: Iotextypes_DepositToRewardingFund?
    public var claimFromRewardingFund: Iotextypes_ClaimFromRewardingFund?
    public var grantReward: Iotextypes_GrantReward?
    public var putPollResult: Iotextypes_PutPollResult?
    
    public init(version: UInt32, nonce: UInt64, gasLimit: UInt64, gasPrice: String) {
        self.version = version
        self.nonce = nonce
        self.gasLimit = gasLimit
        self.gasPrice = gasPrice
    }
    
    public func core() -> Iotextypes_ActionCore {
        var core = Iotextypes_ActionCore()
        core.version = self.version
        core.nonce = self.nonce
        core.gasLimit = self.gasLimit
        core.gasPrice = self.gasPrice
        
        if (self.transfer != nil) {
            core.transfer = self.transfer!
        }
        if (self.execution != nil) {
            core.execution = self.execution!
        }
        if (self.startSubChain != nil) {
            core.startSubChain = self.startSubChain!
        }
        if (self.stopSubChain != nil) {
            core.stopSubChain = self.stopSubChain!
        }
        if (self.putBlock != nil) {
            core.putBlock = self.putBlock!
        }
        if (self.createDeposit != nil) {
            core.createDeposit = self.createDeposit!
        }
        if (self.settleDeposit != nil) {
            core.settleDeposit = self.settleDeposit!
        }
        if (self.createPlumChain != nil) {
            core.createPlumChain = self.createPlumChain!
        }
        if (self.terminatePlumChain != nil) {
            core.terminatePlumChain = self.terminatePlumChain!
        }
        if (self.plumPutBlock != nil) {
            core.plumPutBlock = self.plumPutBlock!
        }
        if (self.plumCreateDeposit != nil) {
            core.plumCreateDeposit = self.plumCreateDeposit!
        }
        if (self.plumStartExit != nil) {
            core.plumStartExit = self.plumStartExit!
        }
        if (self.plumChallengeExit != nil) {
            core.plumChallengeExit = self.plumChallengeExit!
        }
        if (self.plumResponseChallengeExit != nil) {
            core.plumResponseChallengeExit = self.plumResponseChallengeExit!
        }
        if (self.plumFinalizeExit != nil) {
            core.plumFinalizeExit = self.plumFinalizeExit!
        }
        if (self.plumSettleDeposit != nil) {
            core.plumSettleDeposit = self.plumSettleDeposit!
        }
        if (self.plumTransfer != nil) {
            core.plumTransfer = self.plumTransfer!
        }
        if (self.depositToRewardingFund != nil) {
            core.depositToRewardingFund = self.depositToRewardingFund!
        }
        if (self.claimFromRewardingFund != nil) {
            core.claimFromRewardingFund = self.claimFromRewardingFund!
        }
        if (self.grantReward != nil) {
            core.grantReward = self.grantReward!
        }
        if (self.putPollResult != nil) {
            core.putPollResult = self.putPollResult!
        }
        
        return core
    }

    public func byteStream() throws -> Data {
        return try self.core().serializedData()
    }
}
