//
//  HttpClientBuilder.swift
//
//
//  Created by Daniel Safronov on 28.03.2022.
//

import Foundation

/// HttpClientBuilder class.
public final class HttpClientBuilder: HttpClientBuilderProtocol {
    /// HttpClientRequestBuilderProtocol instance.
    private var requestBuilder: HttpClientRequestBuilderProtocol
    
    /// HttpClientExecutorBuilderProtocol instance.
    private var executorBuilder: HttpClientExecutorBuilderProtocol
    
    /// HttpClientResponseHandlerBuilderProtocol instance.
    private var responseHandlerBuilder: HttpClientResponseHandlerBuilderProtocol
    
    /// Create a new HttpClientBuilder instance.
    public init() {
        requestBuilder = HttpClientRequestBuilder()
        executorBuilder = HttpClientExecutorBuilder()
        responseHandlerBuilder = HttpClientResponseHandlerBuilder(decoder: HttpClientResponseJsonDecoder())
    }
    
    /// Register a HttpClientRequestBuilderProtocol instance.
    /// - parameter requestBuilder: An instance of HttpClientRequestBuilderProtocol.
    /// - returns: An instance of HttpClientBuilder.
    public func withRequestBuilder(_ requestBuilder: HttpClientRequestBuilderProtocol) -> Self {
        self.requestBuilder = requestBuilder
        return self
    }
    
    /// Register a HttpClientExecutorBuilderProtocol instance.
    /// - parameter executorBuilder: An instance of HttpClientExecutorBuilderProtocol.
    /// - returns: An instance of HttpClientBuilder.
    public func withExecutorBuilder(_ executorBuilder: HttpClientExecutorBuilderProtocol) -> Self {
        self.executorBuilder = executorBuilder
        return self
    }
    
    /// Register a HttpClientResponseHandlerBuilderProtocol instance.
    /// - parameter responseHandlerBuilder: An instance of HttpClientResponseHandlerBuilderProtocol.
    /// - returns: An instance of HttpClientBuilder.
    public func withResponseHandlerBuilder(_ responseHandlerBuilder: HttpClientResponseHandlerBuilderProtocol) -> Self {
        self.responseHandlerBuilder = responseHandlerBuilder
        return self
    }
    
    /// Create a new HttpClientProtocol instance.
    /// - returns: An instance of HttpClientProtocol.
    public func build() -> HttpClientProtocol {
        HttpClient(
            requestBuilder: requestBuilder,
            executorBuilder: executorBuilder,
            responseHandlerBuilder: responseHandlerBuilder
        )
    }
}
