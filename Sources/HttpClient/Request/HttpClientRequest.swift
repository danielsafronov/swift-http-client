//
//  HttpClientRequest.swift
//
//
//  Created by Daniel Safronov on 28.03.2022.
//

import Foundation

/// HttpClientRequest structure.
public struct HttpClientRequest: HttpClientRequestProtocol {
    /// URLRequest instance.
    public let urlRequest: URLRequest
}
