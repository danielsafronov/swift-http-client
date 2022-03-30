//
//  HttpClientResponseDecoderProtocol.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientResponseDecoderProtocol protocol.
public protocol HttpClientResponseDecoderProtocol {
    /// Decode an instance of HttpClientResponseProtocol to response type.
    /// - parameter response: An instance of HttpClientResponseProtocol.
    /// - returns: A response instance.
    func decode<Response>(response: HttpClientResponseProtocol) throws -> Response where Response: Decodable
}
