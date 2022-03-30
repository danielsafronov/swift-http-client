//
//  HttpClientResponseJsonDecoder.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientResponseJsonDecoder class.
public struct HttpClientResponseJsonDecoder: HttpClientResponseDecoderProtocol {
    /// Decode an instance of HttpClientResponseProtocol to response type.
    /// - parameter response: An instance of HttpClientResponseProtocol.
    /// - returns: A response instance.
    public func decode<Response>(response: HttpClientResponseProtocol) throws -> Response where Response: Decodable {
        guard let decodedData = try? JSONDecoder().decode(Response.self, from: response.data) else {
            throw HttpClientError.decode
        }
        
        return decodedData
    }
}
