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
    public var body: [String : String]? = nil
    public var query: [String : String]? = nil
    public var headers: [HttpRequestHeader]? = nil
    
    /// Initializer.
    /// - parameter url: URL string.
    /// - parameter method: An instance of HttpRequestMethod.
    /// - parameter body: Request body parameters dictionary.
    /// - parameter query: URL query parameters dictionary.
    /// - parameter headers: Request headers dictionary.
    public init(url: String, method: HttpRequestMethod, body: [String: String]? = nil, query: [String: String]? = nil, headers: [HttpRequestHeader]? = nil) {
        self.url = url
        self.method = method
        self.body = body
        self.query = query
        self.headers = headers
    }
}

extension HttpClientRequestParameters {
    public mutating func withHeader(_ header: HttpRequestHeader) {
        if var headers = headers {
            headers.append(header)
            self.headers = headers
        } else {
            headers = [header]
        }
    }
}
