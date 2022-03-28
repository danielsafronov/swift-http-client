//
//  HttpRequestHeader.swift
//  
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpRequestHeader structure.
public struct HttpRequestHeader {
    let key: HttpRequestHeaderKey
    let value: String
    
    /// Initializer.
    /// - parameter key: An instance of HttpRequestHeaderKey.
    /// - parameter value: A header value.
    public init(key: HttpRequestHeaderKey, value: String) {
        self.key = key
        self.value = value
    }
}
