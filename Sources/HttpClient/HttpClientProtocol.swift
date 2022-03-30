//
//  HttpClientProtocol.swift
//
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpClientProtocol protocol.
public protocol HttpClientProtocol {
    /// Perform request.
    /// - parameter params: An instance of HttpClientRequestParameters.
    /// - returns: An instance of Result.
    func request<Response: Decodable>(parameters: HttpClientRequestParameters) async -> Result<Response, Error>
}
