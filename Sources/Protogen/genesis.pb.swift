// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/types/genesis.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

// Copyright (c) 2019 IoTeX
// This is an alpha (internal) release and is not suitable for production. This source code is provided 'as is' and no
// warranties are given as to title or non-infringement, merchantability or fitness for purpose and, to the extent
// permitted by law, all liability for your use of the code is disclaimed. This source code is governed by Apache
// License 2.0 that can be found in the LICENSE file.

/// To compile the proto, run:
///      protoc --go_out=plugins=grpc:$GOPATH/src *.proto

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct Iotextypes_Genesis {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var blockchain: Iotextypes_GenesisBlockchain {
    get {return _storage._blockchain ?? Iotextypes_GenesisBlockchain()}
    set {_uniqueStorage()._blockchain = newValue}
  }
  /// Returns true if `blockchain` has been explicitly set.
  public var hasBlockchain: Bool {return _storage._blockchain != nil}
  /// Clears the value of `blockchain`. Subsequent reads from it will return its default value.
  public mutating func clearBlockchain() {_uniqueStorage()._blockchain = nil}

  public var account: Iotextypes_GenesisAccount {
    get {return _storage._account ?? Iotextypes_GenesisAccount()}
    set {_uniqueStorage()._account = newValue}
  }
  /// Returns true if `account` has been explicitly set.
  public var hasAccount: Bool {return _storage._account != nil}
  /// Clears the value of `account`. Subsequent reads from it will return its default value.
  public mutating func clearAccount() {_uniqueStorage()._account = nil}

  public var poll: Iotextypes_GenesisPoll {
    get {return _storage._poll ?? Iotextypes_GenesisPoll()}
    set {_uniqueStorage()._poll = newValue}
  }
  /// Returns true if `poll` has been explicitly set.
  public var hasPoll: Bool {return _storage._poll != nil}
  /// Clears the value of `poll`. Subsequent reads from it will return its default value.
  public mutating func clearPoll() {_uniqueStorage()._poll = nil}

  public var rewarding: Iotextypes_GenesisRewarding {
    get {return _storage._rewarding ?? Iotextypes_GenesisRewarding()}
    set {_uniqueStorage()._rewarding = newValue}
  }
  /// Returns true if `rewarding` has been explicitly set.
  public var hasRewarding: Bool {return _storage._rewarding != nil}
  /// Clears the value of `rewarding`. Subsequent reads from it will return its default value.
  public mutating func clearRewarding() {_uniqueStorage()._rewarding = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Iotextypes_GenesisBlockchain {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var timestamp: Int64 = 0

  public var blockGasLimit: UInt64 = 0

  public var actionGasLimit: UInt64 = 0

  public var blockInterval: Int64 = 0

  public var numSubEpochs: UInt64 = 0

  public var numDelegates: UInt64 = 0

  public var numCandidateDelegates: UInt64 = 0

  public var timeBasedRotation: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Iotextypes_GenesisAccount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var initBalanceAddrs: [String] = []

  public var initBalances: [String] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Iotextypes_GenesisPoll {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var enableGravityChainVoting: Bool = false

  public var gravityChainStartHeight: UInt64 = 0

  public var registerContractAddress: String = String()

  public var stakingContractAddress: String = String()

  public var voteThreshold: String = String()

  public var scoreThreshold: String = String()

  public var selfStakingThreshold: String = String()

  public var delegates: [Iotextypes_GenesisDelegate] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Iotextypes_GenesisDelegate {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var operatorAddr: String = String()

  public var rewardAddr: String = String()

  public var votes: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Iotextypes_GenesisRewarding {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var initAdminAddr: String = String()

  public var initBalance: String = String()

  public var blockReward: String = String()

  public var epochReward: String = String()

  public var numDelegatesForEpochReward: UInt64 = 0

  public var foundationBonus: String = String()

  public var numDelegatesForFoundationBonus: UInt64 = 0

  public var foundationBonusLastEpoch: UInt64 = 0

  public var productivityThreshold: UInt64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "iotextypes"

extension Iotextypes_Genesis: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Genesis"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "blockchain"),
    2: .same(proto: "account"),
    3: .same(proto: "poll"),
    4: .same(proto: "rewarding"),
  ]

  fileprivate class _StorageClass {
    var _blockchain: Iotextypes_GenesisBlockchain? = nil
    var _account: Iotextypes_GenesisAccount? = nil
    var _poll: Iotextypes_GenesisPoll? = nil
    var _rewarding: Iotextypes_GenesisRewarding? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _blockchain = source._blockchain
      _account = source._account
      _poll = source._poll
      _rewarding = source._rewarding
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._blockchain)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._account)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._poll)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._rewarding)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._blockchain {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._account {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._poll {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if let v = _storage._rewarding {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Iotextypes_Genesis, rhs: Iotextypes_Genesis) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._blockchain != rhs_storage._blockchain {return false}
        if _storage._account != rhs_storage._account {return false}
        if _storage._poll != rhs_storage._poll {return false}
        if _storage._rewarding != rhs_storage._rewarding {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Iotextypes_GenesisBlockchain: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GenesisBlockchain"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "timestamp"),
    2: .same(proto: "blockGasLimit"),
    3: .same(proto: "actionGasLimit"),
    4: .same(proto: "blockInterval"),
    5: .same(proto: "numSubEpochs"),
    6: .same(proto: "numDelegates"),
    7: .same(proto: "numCandidateDelegates"),
    8: .same(proto: "timeBasedRotation"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt64Field(value: &self.timestamp)
      case 2: try decoder.decodeSingularUInt64Field(value: &self.blockGasLimit)
      case 3: try decoder.decodeSingularUInt64Field(value: &self.actionGasLimit)
      case 4: try decoder.decodeSingularInt64Field(value: &self.blockInterval)
      case 5: try decoder.decodeSingularUInt64Field(value: &self.numSubEpochs)
      case 6: try decoder.decodeSingularUInt64Field(value: &self.numDelegates)
      case 7: try decoder.decodeSingularUInt64Field(value: &self.numCandidateDelegates)
      case 8: try decoder.decodeSingularBoolField(value: &self.timeBasedRotation)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.timestamp != 0 {
      try visitor.visitSingularInt64Field(value: self.timestamp, fieldNumber: 1)
    }
    if self.blockGasLimit != 0 {
      try visitor.visitSingularUInt64Field(value: self.blockGasLimit, fieldNumber: 2)
    }
    if self.actionGasLimit != 0 {
      try visitor.visitSingularUInt64Field(value: self.actionGasLimit, fieldNumber: 3)
    }
    if self.blockInterval != 0 {
      try visitor.visitSingularInt64Field(value: self.blockInterval, fieldNumber: 4)
    }
    if self.numSubEpochs != 0 {
      try visitor.visitSingularUInt64Field(value: self.numSubEpochs, fieldNumber: 5)
    }
    if self.numDelegates != 0 {
      try visitor.visitSingularUInt64Field(value: self.numDelegates, fieldNumber: 6)
    }
    if self.numCandidateDelegates != 0 {
      try visitor.visitSingularUInt64Field(value: self.numCandidateDelegates, fieldNumber: 7)
    }
    if self.timeBasedRotation != false {
      try visitor.visitSingularBoolField(value: self.timeBasedRotation, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Iotextypes_GenesisBlockchain, rhs: Iotextypes_GenesisBlockchain) -> Bool {
    if lhs.timestamp != rhs.timestamp {return false}
    if lhs.blockGasLimit != rhs.blockGasLimit {return false}
    if lhs.actionGasLimit != rhs.actionGasLimit {return false}
    if lhs.blockInterval != rhs.blockInterval {return false}
    if lhs.numSubEpochs != rhs.numSubEpochs {return false}
    if lhs.numDelegates != rhs.numDelegates {return false}
    if lhs.numCandidateDelegates != rhs.numCandidateDelegates {return false}
    if lhs.timeBasedRotation != rhs.timeBasedRotation {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Iotextypes_GenesisAccount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GenesisAccount"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "initBalanceAddrs"),
    2: .same(proto: "initBalances"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedStringField(value: &self.initBalanceAddrs)
      case 2: try decoder.decodeRepeatedStringField(value: &self.initBalances)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.initBalanceAddrs.isEmpty {
      try visitor.visitRepeatedStringField(value: self.initBalanceAddrs, fieldNumber: 1)
    }
    if !self.initBalances.isEmpty {
      try visitor.visitRepeatedStringField(value: self.initBalances, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Iotextypes_GenesisAccount, rhs: Iotextypes_GenesisAccount) -> Bool {
    if lhs.initBalanceAddrs != rhs.initBalanceAddrs {return false}
    if lhs.initBalances != rhs.initBalances {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Iotextypes_GenesisPoll: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GenesisPoll"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "enableGravityChainVoting"),
    2: .same(proto: "gravityChainStartHeight"),
    3: .same(proto: "registerContractAddress"),
    4: .same(proto: "stakingContractAddress"),
    5: .same(proto: "voteThreshold"),
    6: .same(proto: "scoreThreshold"),
    7: .same(proto: "selfStakingThreshold"),
    8: .same(proto: "delegates"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.enableGravityChainVoting)
      case 2: try decoder.decodeSingularUInt64Field(value: &self.gravityChainStartHeight)
      case 3: try decoder.decodeSingularStringField(value: &self.registerContractAddress)
      case 4: try decoder.decodeSingularStringField(value: &self.stakingContractAddress)
      case 5: try decoder.decodeSingularStringField(value: &self.voteThreshold)
      case 6: try decoder.decodeSingularStringField(value: &self.scoreThreshold)
      case 7: try decoder.decodeSingularStringField(value: &self.selfStakingThreshold)
      case 8: try decoder.decodeRepeatedMessageField(value: &self.delegates)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.enableGravityChainVoting != false {
      try visitor.visitSingularBoolField(value: self.enableGravityChainVoting, fieldNumber: 1)
    }
    if self.gravityChainStartHeight != 0 {
      try visitor.visitSingularUInt64Field(value: self.gravityChainStartHeight, fieldNumber: 2)
    }
    if !self.registerContractAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.registerContractAddress, fieldNumber: 3)
    }
    if !self.stakingContractAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.stakingContractAddress, fieldNumber: 4)
    }
    if !self.voteThreshold.isEmpty {
      try visitor.visitSingularStringField(value: self.voteThreshold, fieldNumber: 5)
    }
    if !self.scoreThreshold.isEmpty {
      try visitor.visitSingularStringField(value: self.scoreThreshold, fieldNumber: 6)
    }
    if !self.selfStakingThreshold.isEmpty {
      try visitor.visitSingularStringField(value: self.selfStakingThreshold, fieldNumber: 7)
    }
    if !self.delegates.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.delegates, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Iotextypes_GenesisPoll, rhs: Iotextypes_GenesisPoll) -> Bool {
    if lhs.enableGravityChainVoting != rhs.enableGravityChainVoting {return false}
    if lhs.gravityChainStartHeight != rhs.gravityChainStartHeight {return false}
    if lhs.registerContractAddress != rhs.registerContractAddress {return false}
    if lhs.stakingContractAddress != rhs.stakingContractAddress {return false}
    if lhs.voteThreshold != rhs.voteThreshold {return false}
    if lhs.scoreThreshold != rhs.scoreThreshold {return false}
    if lhs.selfStakingThreshold != rhs.selfStakingThreshold {return false}
    if lhs.delegates != rhs.delegates {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Iotextypes_GenesisDelegate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GenesisDelegate"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "operatorAddr"),
    2: .same(proto: "rewardAddr"),
    3: .same(proto: "votes"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.operatorAddr)
      case 2: try decoder.decodeSingularStringField(value: &self.rewardAddr)
      case 3: try decoder.decodeSingularStringField(value: &self.votes)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.operatorAddr.isEmpty {
      try visitor.visitSingularStringField(value: self.operatorAddr, fieldNumber: 1)
    }
    if !self.rewardAddr.isEmpty {
      try visitor.visitSingularStringField(value: self.rewardAddr, fieldNumber: 2)
    }
    if !self.votes.isEmpty {
      try visitor.visitSingularStringField(value: self.votes, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Iotextypes_GenesisDelegate, rhs: Iotextypes_GenesisDelegate) -> Bool {
    if lhs.operatorAddr != rhs.operatorAddr {return false}
    if lhs.rewardAddr != rhs.rewardAddr {return false}
    if lhs.votes != rhs.votes {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Iotextypes_GenesisRewarding: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GenesisRewarding"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "initAdminAddr"),
    2: .same(proto: "initBalance"),
    3: .same(proto: "blockReward"),
    4: .same(proto: "epochReward"),
    5: .same(proto: "numDelegatesForEpochReward"),
    6: .same(proto: "foundationBonus"),
    7: .same(proto: "numDelegatesForFoundationBonus"),
    8: .same(proto: "foundationBonusLastEpoch"),
    9: .same(proto: "productivityThreshold"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.initAdminAddr)
      case 2: try decoder.decodeSingularStringField(value: &self.initBalance)
      case 3: try decoder.decodeSingularStringField(value: &self.blockReward)
      case 4: try decoder.decodeSingularStringField(value: &self.epochReward)
      case 5: try decoder.decodeSingularUInt64Field(value: &self.numDelegatesForEpochReward)
      case 6: try decoder.decodeSingularStringField(value: &self.foundationBonus)
      case 7: try decoder.decodeSingularUInt64Field(value: &self.numDelegatesForFoundationBonus)
      case 8: try decoder.decodeSingularUInt64Field(value: &self.foundationBonusLastEpoch)
      case 9: try decoder.decodeSingularUInt64Field(value: &self.productivityThreshold)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.initAdminAddr.isEmpty {
      try visitor.visitSingularStringField(value: self.initAdminAddr, fieldNumber: 1)
    }
    if !self.initBalance.isEmpty {
      try visitor.visitSingularStringField(value: self.initBalance, fieldNumber: 2)
    }
    if !self.blockReward.isEmpty {
      try visitor.visitSingularStringField(value: self.blockReward, fieldNumber: 3)
    }
    if !self.epochReward.isEmpty {
      try visitor.visitSingularStringField(value: self.epochReward, fieldNumber: 4)
    }
    if self.numDelegatesForEpochReward != 0 {
      try visitor.visitSingularUInt64Field(value: self.numDelegatesForEpochReward, fieldNumber: 5)
    }
    if !self.foundationBonus.isEmpty {
      try visitor.visitSingularStringField(value: self.foundationBonus, fieldNumber: 6)
    }
    if self.numDelegatesForFoundationBonus != 0 {
      try visitor.visitSingularUInt64Field(value: self.numDelegatesForFoundationBonus, fieldNumber: 7)
    }
    if self.foundationBonusLastEpoch != 0 {
      try visitor.visitSingularUInt64Field(value: self.foundationBonusLastEpoch, fieldNumber: 8)
    }
    if self.productivityThreshold != 0 {
      try visitor.visitSingularUInt64Field(value: self.productivityThreshold, fieldNumber: 9)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Iotextypes_GenesisRewarding, rhs: Iotextypes_GenesisRewarding) -> Bool {
    if lhs.initAdminAddr != rhs.initAdminAddr {return false}
    if lhs.initBalance != rhs.initBalance {return false}
    if lhs.blockReward != rhs.blockReward {return false}
    if lhs.epochReward != rhs.epochReward {return false}
    if lhs.numDelegatesForEpochReward != rhs.numDelegatesForEpochReward {return false}
    if lhs.foundationBonus != rhs.foundationBonus {return false}
    if lhs.numDelegatesForFoundationBonus != rhs.numDelegatesForFoundationBonus {return false}
    if lhs.foundationBonusLastEpoch != rhs.foundationBonusLastEpoch {return false}
    if lhs.productivityThreshold != rhs.productivityThreshold {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
