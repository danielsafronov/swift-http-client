//
//  HttpClientResponseHandler.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientResponseHandler class.
public struct HttpClientResponseHandler: HttpClientResponseHandlerProtocol {
    /// HttpClientResponseDecoderProtocol instance.
    public let decoder: HttpClientResponseDecoderProtocol
    
    /// Response error transform closure.
    public var responseErrorTransformer: HttpResponseErrorTransformer? = nil
    
    /// Handle an instance of HttpClientResponseProtocol.
    /// - parameter response: An instance of HttpClientResponseProtocol.
    /// - parameter decoder: An instance of HttpClientResponseDecoderProtocol
    /// - returns: A response instance.
    /// - throws: If something went wrong.
    public func handle<Response>(response: HttpClientResponseProtocol) throws -> Response where Response: Decodable {
        guard let httpUrlResponse = response.urlResponse as? HTTPURLResponse else {
            throw HttpClientError.invalidResponse
        }
        
        guard let statusCode = HttpResponseStatusCode(rawValue: httpUrlResponse.statusCode) else {
            throw HttpClientError.unsupportedStatusCode
        }
        
        if statusCode.isSuccess {
            if Response.self == Data.self {
                return response.data as! Response
            }
            
            return try decoder.decode(response: response)
        } else {
            let error = HttpResponseError(data: response.data, response: response.urlResponse)
            if let responseErrorTransformer = responseErrorTransformer {
                throw responseErrorTransformer(error)
            }
            
            throw error
        }
    }
}
