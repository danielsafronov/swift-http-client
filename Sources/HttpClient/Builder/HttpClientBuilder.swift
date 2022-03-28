//
//  HttpClientBuilder.swift
//
//
//  Created by Daniel Safronov on 28.03.2022.
//

import Foundation

/// HttpClientBuilder class.
final class HttpClientBuilder {
    /// Response error transform closure typealias.
    typealias ResponseErrorTransformer = (HttpResponseError) -> Error
    
    /// Response error transform closure.
    private var responseErrorTransformer: ResponseErrorTransformer?
    
    /// Adds transform closure for the HttpClient instance.
    /// - parameter transform: Response error transform closure.
    /// - returns: An instance of HttpClientBuilder.
    public func withMapError(_ transform: ResponseErrorTransformer?) -> Self {
        responseErrorTransformer = transform
        return self
    }
    
    /// Creates and returns an instance of HttpClient.
    /// - returns: An instance of HttpClient.
    public func build() -> HttpClient {
        let httpClient = HttpClient()
        httpClient.responseErrorTransformer = responseErrorTransformer
        
        return httpClient
    }
}
