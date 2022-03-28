//
//  HttpClientProtocol.swift
//
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpClientProtocol protocol.
protocol HttpClientProtocol {
    /// Performs HTTP request.
    /// - parameter endpoint: An instance of HttpClientRequestParametersProtocol.
    /// - returns: An instance of Result.
    func request<T: Decodable>(params: HttpClientRequestParametersProtocol) async -> Result<T, Error>
}
