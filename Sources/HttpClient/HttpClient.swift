//
//  HttpClient.swift
//
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpClient class.
public final class HttpClient: HttpClientProtocol {
    /// Response error transform closure.
    public var responseErrorTransformer: HttpResponseErrorTransformer?
    
    /// HttpClientRequestBuilder instance.
    private let requestBuilder: HttpClientRequestBuilder
    
    /// Create a new HttpClient instance.
    /// - parameter requestBuilder: An instance of HttpClientRequestBuilder.
    public init(requestBuilder: HttpClientRequestBuilder) {
        self.requestBuilder = requestBuilder
    }
    
    /// Perform HTTP request.
    /// - parameter endpoint: An instance of HttpClientRequestParameters.
    /// - returns: An instance of Result.
    public func request<T: Decodable>(params: HttpClientRequestParameters) async -> Result<T, Error> {
        do {
            return try await requestBuilder
                .withMapError(responseErrorTransformer)
                .build(with: params)
                .execute()
        } catch {
            return .failure(error)
        }
    }
}
