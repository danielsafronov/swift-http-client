//
//  HttpClientProtocol.swift
//
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpClientProtocol protocol.
public protocol HttpClientProtocol {
    /// Perform HTTP request.
    /// - parameter parameters: An instance of HttpClientRequestParametersProtocol.
    /// - returns: An instance of Result.
    func request<Response: Decodable>(with parameters: HttpClientRequestParametersProtocol) async -> Result<Response, Error>
}
