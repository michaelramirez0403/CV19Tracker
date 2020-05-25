//
//  JSONSchemaSupport.swift
//  Deliveries
//
//  Created by Macky Ramirez on 5/19/20.
//  Copyright © 2020 Macky Ramirez. All rights reserved.
//
import Foundation
// MARK: - Helper functions for creating encoders and decoders
class JSONSchemaSupport {
    func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }
    func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        return encoder
    }
}
