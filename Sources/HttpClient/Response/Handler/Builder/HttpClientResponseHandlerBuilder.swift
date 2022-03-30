//
//  HttpClientResponseHandlerBuilder.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientResponseHandlerBuilder class.
public final class HttpClientResponseHandlerBuilder: HttpClientResponseHandlerBuilderProtocol {
    /// HttpClientResponseDecoderProtocol instance.
    private let decoder: HttpClientResponseDecoderProtocol
    
    /// Response error transform closure.
    private var responseErrorTransformer: HttpResponseErrorTransformer?
    
    /// Create a new HttpClientResponseHandlerBuilder instance.
    /// - parameter decoder: An instance of HttpClientResponseDecoderProtocol.
    public init(decoder: HttpClientResponseDecoderProtocol) {
        self.decoder = decoder
    }
    
    /// Register response error transform closure.
    /// - parameter transform: Response error transform closure.
    /// - returns: An instance of HttpClientResponseHandlerBuilder.
    public func withMapError(_ transform: HttpResponseErrorTransformer?) -> Self {
        responseErrorTransformer = transform
        return self
    }
    
    /// Create a new HttpClientResponseHandlerProtocol instance.
    /// - returns: An instance of HttpClientResponseHandlerProtocol.
    public func build() -> HttpClientResponseHandlerProtocol {
        HttpClientResponseHandler(decoder: decoder, responseErrorTransformer: responseErrorTransformer)
    }
}
