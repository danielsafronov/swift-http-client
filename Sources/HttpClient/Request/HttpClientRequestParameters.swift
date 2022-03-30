//
//  HttpClientRequestParameters.swift
//
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpClientRequestParameters structure.
public struct HttpClientRequestParameters {
    public var url: String
    public var method: HttpRequestMethod
    public var bodyParameters: HttpClientRequestBodyParameters = [:]
    public var queryParameters: HttpClientRequestQueryParameters = [:]
    public var headers: HttpClientRequestHeaders = [:]
    
    /// Initializer.
    /// - parameter url: URL string.
    /// - parameter method: An instance of HttpRequestMethod.
    /// - parameter bodyParameters: Request body parameters dictionary.
    /// - parameter queryParameters: URL query parameters dictionary.
    /// - parameter headers: Request headers dictionary.
    public init(url: String, method: HttpRequestMethod, bodyParameters: HttpClientRequestBodyParameters = [:], queryParameters: HttpClientRequestQueryParameters = [:], headers: HttpClientRequestHeaders = [:]) {
        self.url = url
        self.method = method
        self.bodyParameters = bodyParameters
        self.queryParameters = queryParameters
        self.headers = headers
    }
}

extension HttpClientRequestParameters {
    /// Add header.
    /// - parameter key: A header key.
    /// - parameter value: A header value.
    public mutating func withHeader(key: String, value: String) {
        headers[key] = value
    }
}
