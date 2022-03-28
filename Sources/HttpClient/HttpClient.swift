//
//  HttpClient.swift
//
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpClient class.
public final class HttpClient: HttpClientProtocol {
    /// Response error transform closure typealias.
    public typealias ResponseErrorTransformer = (HttpResponseError) -> Error

    /// Response error transform closure.
    public var responseErrorTransformer: ResponseErrorTransformer?
    
    /// Performs HTTP request.
    /// - parameter endpoint: An instance of HttpClientRequestParametersProtocol.
    /// - returns: An instance of Result.
    public func request<T: Decodable>(params: HttpClientRequestParametersProtocol) async -> Result<T, Error> {
        do {
            return try await HttpClientRequestBuilder(parameters: params)
                .withMapError(responseErrorTransformer)
                .build()
                .execute()
        } catch {
            return .failure(error)
        }
    }
}
