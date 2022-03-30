//
//  HttpClientExecutorProtocol.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientRequestProtocol protocol.
public protocol HttpClientExecutorProtocol {
    /// Execute HTTP request.
    /// - parameter request: An instance of HttpClientRequestProtocol.
    /// - returns: An instance of HttpClientResponseProtocol.
    func execute(request: HttpClientRequestProtocol) async throws -> HttpClientResponseProtocol
}
