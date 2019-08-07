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
    public var transfer: Iotextypes_Transfer
    public var execution: Iotextypes_Execution
    public var startSubChain: Iotextypes_StartSubChain
    public var stopSubChain: Iotextypes_StopSubChain
    public var putBlock: Iotextypes_PutBlock
    public var createDeposit: Iotextypes_CreateDeposit
    public var settleDeposit: Iotextypes_SettleDeposit
    public var createPlumChain: Iotextypes_CreatePlumChain
    public var terminatePlumChain: Iotextypes_TerminatePlumChain
    public var plumPutBlock: Iotextypes_PlumPutBlock
    public var plumCreateDeposit: Iotextypes_PlumCreateDeposit
    public var plumStartExit: Iotextypes_PlumStartExit
    public var plumChallengeExit: Iotextypes_PlumChallengeExit
    public var plumResponseChallengeExit: Iotextypes_PlumResponseChallengeExit
    public var plumFinalizeExit: Iotextypes_PlumFinalizeExit
    public var plumSettleDeposit: Iotextypes_PlumSettleDeposit
    public var plumTransfer: Iotextypes_PlumTransfer
    public var depositToRewardingFund: Iotextypes_DepositToRewardingFund
    public var claimFromRewardingFund: Iotextypes_ClaimFromRewardingFund
    public var grantReward: Iotextypes_GrantReward
    public var putPollResult: Iotextypes_PutPollResult
    
    public func core() -> Iotextypes_ActionCore {
        var core = Iotextypes_ActionCore()
        core.version = self.version
        core.nonce = self.nonce
        core.gasLimit = self.gasLimit
        core.gasPrice = self.gasPrice
        
        core.transfer = self.transfer
        core.execution = self.execution
        core.startSubChain = self.startSubChain
        core.stopSubChain = self.stopSubChain
        core.putBlock = self.putBlock
        core.createDeposit = self.createDeposit
        core.settleDeposit = self.settleDeposit
        core.createPlumChain = self.createPlumChain
        core.terminatePlumChain = self.terminatePlumChain
        core.plumPutBlock = self.plumPutBlock
        core.plumCreateDeposit = self.plumCreateDeposit
        core.plumStartExit = self.plumStartExit
        core.plumChallengeExit = self.plumChallengeExit
        core.plumResponseChallengeExit = self.plumResponseChallengeExit
        core.plumFinalizeExit = self.plumFinalizeExit
        core.plumSettleDeposit = self.plumSettleDeposit
        core.plumTransfer = self.plumTransfer
        core.depositToRewardingFund = self.depositToRewardingFund
        core.claimFromRewardingFund = self.claimFromRewardingFund
        core.grantReward = self.grantReward
        core.putPollResult = self.putPollResult
        
        return core
    }

    public func byteStream() throws -> Data {
        return try self.core().serializedData()
    }
}
