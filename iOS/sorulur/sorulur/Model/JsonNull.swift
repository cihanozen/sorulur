//
//  JsonNull.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation

// MARK: Encode/decode helpers

/// Json Null Control
class JSONNull: Codable, Hashable {
    /// Equable parameters
    ///
    /// - Parameters:
    ///   - lhs: First Data
    ///   - rhs: Second Data
    /// - Returns: Bool
    ///    ### Usage Example: ###
    ///    ````
    ///    if JSONNull(lhs: JSONNull, rhs: JSONNull) {
    ///        ...
    ///    }
    ///    ````
    public static func == (_: JSONNull, _: JSONNull) -> Bool {
        return true
    }

    /// Hash Value
    public var hashValue: Int {
        return 0
    }

    /// Emptt init
    public init() {}

    /// Decoder
    ///
    /// - Parameter decoder: A type that can decode values from a native format into in-memory representations.
    /// - Throws: An error that occurs during the decoding of a value.
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    /// Encoder
    ///
    /// - Parameter encoder: A type that can encode values into a native format for external representation.
    /// - Throws: Returns an encoding container appropriate for holding a single primitive value.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

/// Create Json Decoder
///
/// - Returns: An object that decodes instances of a data type from JSON objects.
func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

/// Create Json Encoder
///
/// - Returns: An object that encodes instances of a data type as JSON objects.
func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
