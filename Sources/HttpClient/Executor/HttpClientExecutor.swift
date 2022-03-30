//
//  HttpClientExecutor.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientExecutor class.
public final class HttpClientExecutor: HttpClientExecutorProtocol {
    /// URLSession instance.
    private let session: URLSession
    
    /// Create a new HttpClientExecutor instance.
    /// - parameter session: An instance of URLSession.
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    /// Execute HTTP request.
    /// - parameter request: An instance of HttpClientRequestProtocol.
    /// - returns: An instance of HttpClientResponseProtocol.
    public func execute(request: HttpClientRequestProtocol) async throws -> HttpClientResponseProtocol {
        let (data, urlResponse) = try await URLSession.shared.data(for: request.urlRequest, delegate: nil)
        return HttpClientResponse(data: data, urlResponse: urlResponse)
    }
}
