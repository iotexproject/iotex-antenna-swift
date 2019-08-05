// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/types/node.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

// Copyright (c) 2018 IoTeX
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

/// Server Metadata
struct Iotextypes_ServerMeta {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var packageVersion: String = String()

  var packageCommitID: String = String()

  var gitStatus: String = String()

  var goVersion: String = String()

  var buildTime: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "iotextypes"

extension Iotextypes_ServerMeta: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ServerMeta"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "packageVersion"),
    2: .same(proto: "packageCommitID"),
    3: .same(proto: "gitStatus"),
    4: .same(proto: "goVersion"),
    5: .same(proto: "buildTime"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.packageVersion)
      case 2: try decoder.decodeSingularStringField(value: &self.packageCommitID)
      case 3: try decoder.decodeSingularStringField(value: &self.gitStatus)
      case 4: try decoder.decodeSingularStringField(value: &self.goVersion)
      case 5: try decoder.decodeSingularStringField(value: &self.buildTime)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.packageVersion.isEmpty {
      try visitor.visitSingularStringField(value: self.packageVersion, fieldNumber: 1)
    }
    if !self.packageCommitID.isEmpty {
      try visitor.visitSingularStringField(value: self.packageCommitID, fieldNumber: 2)
    }
    if !self.gitStatus.isEmpty {
      try visitor.visitSingularStringField(value: self.gitStatus, fieldNumber: 3)
    }
    if !self.goVersion.isEmpty {
      try visitor.visitSingularStringField(value: self.goVersion, fieldNumber: 4)
    }
    if !self.buildTime.isEmpty {
      try visitor.visitSingularStringField(value: self.buildTime, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Iotextypes_ServerMeta, rhs: Iotextypes_ServerMeta) -> Bool {
    if lhs.packageVersion != rhs.packageVersion {return false}
    if lhs.packageCommitID != rhs.packageCommitID {return false}
    if lhs.gitStatus != rhs.gitStatus {return false}
    if lhs.goVersion != rhs.goVersion {return false}
    if lhs.buildTime != rhs.buildTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}