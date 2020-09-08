//
//  BIP39.swift
//  iotex-antenna-swift
//
//  Created by ququzone on 2020/9/7.
//  Copyright © 2020 IoTeX. All rights reserved.
//

import Foundation
import CryptoSwift

public enum BIP39Language {
    case english
    case chinese_simplified
    
    public var words: [String] {
        switch self {
        case .english:
            return englishWords
        case .chinese_simplified:
            return simplifiedchineseWords
        }
    }
    
    public var separator: String {
        return " "
    }
    
    init?(language: String) {
        switch language {
        case "english":
            self = .english
        case "chinese_simplified":
            self = .chinese_simplified
        default:
            return nil
        }
    }
}

public class BIP39 {
    enum Error: Swift.Error {
        case noEntropyError
    }
    
    static public func generateMnemonicsFromEntropy(entropy: Data, language: BIP39Language = BIP39Language.english) -> String?  {
        guard entropy.count >= 16, entropy.count & 4 == 0 else {return nil}
        let checksum = entropy.sha256()
        let checksumBits = entropy.count*8/32
        var fullEntropy = Data()
        fullEntropy.append(entropy)
        fullEntropy.append(checksum[0 ..< (checksumBits+7)/8 ])
        var wordList = [String]()
        for i in 0 ..< fullEntropy.count*8/11 {
            guard let bits = fullEntropy.bitsInRange(i*11, 11) else {return nil}
            let index = Int(bits)
            guard language.words.count > index else {return nil}
            let word = language.words[index]
            wordList.append(word)
        }
        let separator = language.separator
        return wordList.joined(separator: separator)
    }
    
    static public func generateMnemonics(bitsOfEntropy: Int, language: BIP39Language = BIP39Language.english) throws -> String? {
        guard bitsOfEntropy >= 128 && bitsOfEntropy <= 256 && bitsOfEntropy.isMultiple(of: 32) else {return nil}
        guard let entropy = Data.randomBytes(length: bitsOfEntropy/8) else {throw Error.noEntropyError}
        return BIP39.generateMnemonicsFromEntropy(entropy: entropy, language: language)
    }
    
    static public func mnemonicsToEntropy(_ mnemonics: String, language: BIP39Language = BIP39Language.english) -> Data? {
        let wordList = mnemonics.components(separatedBy: " ")
        guard wordList.count >= 12 && wordList.count.isMultiple(of: 4) else {return nil}
        var bitString = ""
        for word in wordList {
            let idx = language.words.firstIndex(of: word)
            if (idx == nil) {
                return nil
            }
            let idxAsInt = language.words.startIndex.distance(to: idx!)
            let stringForm = String(UInt16(idxAsInt), radix: 2).paddingLeft(toLength: 11, withPad: "0")
            bitString.append(stringForm)
        }
        let stringCount = bitString.count
        if !stringCount.isMultiple(of: 33) {
            return nil
        }
        let entropyBits = bitString[0 ..< (bitString.count - bitString.count/33)]
        let checksumBits = bitString[(bitString.count - bitString.count/33) ..< bitString.count]
        guard let entropy = entropyBits.interpretAsBinaryData() else {
            return nil
        }
        let checksum = String(entropy.sha256().bitsInRange(0, checksumBits.count)!, radix: 2).paddingLeft(toLength: checksumBits.count, withPad: "0")
        if checksum != checksumBits {
            return nil
        }
        return entropy
    }
    
    static public func seedFromMmemonics(_ mnemonics: String, password: String = "", language: BIP39Language = BIP39Language.english) -> Data? {
        let valid = BIP39.mnemonicsToEntropy(mnemonics, language: language) != nil
        if (!valid) {
            return nil
        }
        guard let mnemData = mnemonics.decomposedStringWithCompatibilityMapping.data(using: .utf8) else {return nil}
        let salt = "mnemonic" + password
        guard let saltData = salt.decomposedStringWithCompatibilityMapping.data(using: .utf8) else {return nil}
        guard let seedArray = try? PKCS5.PBKDF2(password: mnemData.bytes, salt: saltData.bytes, iterations: 2048, keyLength: 64, variant: HMAC.Variant.sha512).calculate() else {return nil}
        let seed = Data(seedArray)
        return seed
    }
    
    static public func seedFromEntropy(_ entropy: Data, password: String = "", language: BIP39Language = BIP39Language.english) -> Data? {
        guard let mnemonics = BIP39.generateMnemonicsFromEntropy(entropy: entropy, language: language) else {
            return nil
        }
        return BIP39.seedFromMmemonics(mnemonics, password: password, language: language)
    }
}
