//
//  HttpClientRequestBuilder.swift
//
//
//  Created by Daniel Safronov on 28.03.2022.
//

import Foundation

/// HttpClientRequestBuilder class.
public final class HttpClientRequestBuilder: HttpClientRequestBuilderProtocol {
    /// Request headers transform closure.
    private var requestHeadersTransformer: HttpClientRequestHeadersTransformer?
    
    /// Create a new HttpClientRequestProtocol instance.
    /// - parameter prameters: An instance of HttpClientRequestParameters.
    /// - returns: An instance of HttpClientRequestProtocol.
    /// - throws: If something went wrong.
    public func build(with parameters: HttpClientRequestParameters) throws -> HttpClientRequestProtocol {
        try buildHttpClientRequest(parameters: parameters)
    }
    
    /// Creates and returns an instance of HttpClientRequest.
    /// - parameter parameters: An instance of HttpClientRequestParametersProtocol.
    /// - returns: An instance of HttpClientRequest.
    /// - throws: If something went wrong.
    private func buildHttpClientRequest(parameters: HttpClientRequestParameters) throws -> HttpClientRequest {
        let urlComponents = try URLComponentsBuilder(url: parameters.url)
            .withQueryParameters(parameters: parameters.queryParameters)
            .build()
        
        guard let url = urlComponents.url else {
            throw HttpClientError.invalidURL
        }
        
        var headers = parameters.headers
        if let requestHeadersTransformer = requestHeadersTransformer {
            headers = requestHeadersTransformer(headers)
        }
        
        let request = URLRequestBuilder(url: url, method: parameters.method.rawValue)
            .withBodyParameters(parameters.bodyParameters)
            .withHeaders(headers)
            .build()
        
        return .init(urlRequest: request)
    }
    
    /// Register request headers transform closure.
    /// - parameter transform: Request headers transform closure.
    /// - returns: An instance of HttpClientRequestBuilder.
    public func withMapHeaders(_ transform: HttpClientRequestHeadersTransformer?) -> Self {
        requestHeadersTransformer = transform
        return self
    }
}

/// URLComponentsBuilder class.
internal final class URLComponentsBuilder {
    /// URL query parameters dictionary typealias.
    internal typealias QueryParameters = [String: String]
    
    /// URL string.
    private let url: String
    
    /// URL query parameters dictionary.
    private var queryParameters: QueryParameters = [:]
    
    /// Initializer.
    /// - parameter url: URL string.
    init(url: String) {
        self.url = url
    }
    
    /// Adds query parameters for the URLComponents instance.
    /// - parameter parameters: URL query parameters dictionary.
    /// - returns: An instance of URLComponentsBuilder.
    public func withQueryParameters(parameters: QueryParameters) -> Self {
        queryParameters = parameters
        return self
    }
    
    /// Creates and returns an instance of URLComponents.
    /// - returns: An instance of URLComponents.
    /// - throws: If URL is invalid.
    public func build() throws -> URLComponents {
        guard var urlComponents = URLComponents(string: url) else {
            throw HttpClientError.invalidURL
        }
        
        if !queryParameters.isEmpty {
            urlComponents.queryItems = queryParameters.map {
                .init(name: $0.key, value: $0.value)
            }
        }
        
        return urlComponents
    }
}

/// URLRequestBuilder class.
internal final class URLRequestBuilder {
    /// Request body parameters dictionary typealias.
    internal typealias BodyParameters = [String: String]
    
    /// Request headers dictionary typealias.
    typealias Headers = [String: String]
    
    /// URL instance.
    private let url: URL
    
    /// Request type string.
    private let method: String
    
    /// Request body parameters dictionary.
    private var bodyParameters: BodyParameters = [:]
    
    /// Request headers dictionary.
    private var headers: Headers = [:]
    
    /// Initializer.
    /// - parameter url: An instance of URL
    /// - parameter method: HTTP method.
    init(url: URL, method: String) {
        self.url = url
        self.method = method
    }
    
    /// Adds request body parameters for the URLRequest instance.
    /// - parameter parameters: Request body parameters dictionary.
    /// - returns: An instance of URLRequestBuilder.
    public func withBodyParameters(_ bodyParameters: BodyParameters) -> URLRequestBuilder {
        self.bodyParameters = bodyParameters
        return self
    }
    
    /// Adds request headers for the URLRequest instance.
    /// - parameter parameters: Request headers dictionary.
    /// - returns: An instance of URLRequestBuilder.
    public func withHeaders(_ headers: Headers) -> URLRequestBuilder {
        self.headers = headers
        return self
    }
    
    /// Creates and returns an instance of URLRequest.
    /// - returns: An instance of URLRequest.
    public func build() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        if !bodyParameters.isEmpty {
            request.httpBody = try? JSONSerialization.data(withJSONObject: bodyParameters, options: [])
        }
        
        if !headers.isEmpty {
            headers.forEach {
                request.setValue($0.value, forHTTPHeaderField: $0.key)
            }
        }
        
        return request
    }
}
