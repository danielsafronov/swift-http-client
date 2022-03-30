//
//  HttpClientResponseHandlerProtocol.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientResponseHandlerProtocol protocol.
public protocol HttpClientResponseHandlerProtocol {
    /// Handle an instance of HttpClientResponseProtocol.
    /// - parameter response: An instance of HttpClientResponseProtocol.
    /// - returns: A response instance.
    /// - throws: If something went wrong.
    func handle<Response>(response: HttpClientResponseProtocol) throws -> Response where Response: Decodable
}
