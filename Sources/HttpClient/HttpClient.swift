//
//  HttpClient.swift
//
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpClient class.
public struct HttpClient: HttpClientProtocol {
    /// HttpClientRequestBuilder instance.
    private let requestBuilder: HttpClientRequestBuilderProtocol
    
    /// HttpClientExecutorBuilderProtocol instance.
    private let executorBuilder: HttpClientExecutorBuilderProtocol
    
    /// HttpClientResponseHandlerProtocol instance.
    private let responseHandlerBuilder: HttpClientResponseHandlerBuilderProtocol
    
    /// Create a new HttpClient instance.
    /// - parameter requestBuilder: An instance of HttpClientRequestBuilderProtocol.
    /// - parameter executorBuilder: An instance of HttpClientExecutorBuilderProtocol.
    /// - parameter responseHandlerBuilder: An instance of HttpClientResponseHandlerBuilderProtocol.
    public init(
        requestBuilder: HttpClientRequestBuilderProtocol,
        executorBuilder: HttpClientExecutorBuilderProtocol,
        responseHandlerBuilder: HttpClientResponseHandlerBuilderProtocol
    ) {
        self.requestBuilder = requestBuilder
        self.executorBuilder = executorBuilder
        self.responseHandlerBuilder = responseHandlerBuilder
    }
    
    /// Perform HTTP request.
    /// - parameter endpoint: An instance of HttpClientRequestParameters.
    /// - returns: An instance of Result.
    public func request<Response>(parameters: HttpClientRequestParameters) async -> Result<Response, Error> where Response: Decodable {
        do {
            let httpRequest = try requestBuilder.build(with: parameters)
            let httpResponse = try await executorBuilder.build().execute(request: httpRequest)
            let response: Response = try responseHandlerBuilder.build().handle(response: httpResponse)
            
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
}
