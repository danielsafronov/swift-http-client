//
//  HttpClientExecutorBuilder.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientExecutorBuilder instance.
public final class HttpClientExecutorBuilder: HttpClientExecutorBuilderProtocol {
    /// URLSession instance.
    private var session: URLSession = .shared
    
    /// Create a new HttpClientExecutorBuilder instance.
    public init() {}
    
    /// Register a URLSession instance.
    /// - parameter session: An instance of URLSession.
    /// - returns: An instance of HttpClientExecutorBuilder.
    public func withSession(session: URLSession) -> Self {
        self.session = session
        return self
    }
    
    /// Create a new HttpClientExecutorProtocol instance.
    /// - returns: An instance of HttpClientExecutorProtocol.
    public func build() -> HttpClientExecutorProtocol {
        HttpClientExecutor(session: session)
    }
}
