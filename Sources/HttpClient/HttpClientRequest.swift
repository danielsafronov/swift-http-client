//
//  HttpClientRequest.swift
//
//
//  Created by Daniel Safronov on 28.03.2022.
//

import Foundation

/// HttpClientRequest class.
final class HttpClientRequest {
    typealias ResponseErrorMapper = (HttpResponseError) -> Error
    
    /// URLRequest instance.
    private let request: URLRequest
    
    /// Unprocessable content error map closure.
    public var responseErrorMapper: ResponseErrorMapper?
    
    /// Initializer.
    /// - parameter request: An instance of URLRequest.
    init (request: URLRequest) {
        self.request = request
    }
    
    /// Performs request execution and returns result of it.
    /// - returns: A result of request executuion.
    public func execute<T>() async -> Result<T, Error> where T: Decodable {
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: request, delegate: nil)
            let response: T = try handleResponse(data: data, response: urlResponse)
            
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    /// Handles an HTTP response with data.
    /// - parameter data: An instance of Data.
    /// - parameter response: An instance of URLResponse.
    /// - throws: If something went wrong.
    private func handleResponse<T>(data: Data, response: URLResponse) throws -> T where T: Decodable{
        guard let response = response as? HTTPURLResponse else {
            throw HttpClientError.invalidResponse
        }
        
        guard let statusCode = HttpStatusCode(rawValue: response.statusCode) else {
            throw HttpClientError.unsupportedStatusCode
        }
        
        if statusCode.isSuccess {
            return try decodeResponseData(data: data)
        } else {
            let error = HttpResponseError(data: data, response: response)
            if let responseErrorMapper = responseErrorMapper {
                throw responseErrorMapper(error)
            }
            
            throw error
        }
    }
    
    /// Decodes the response data.
    /// - parameter data: An instance of Data.
    /// - throws: If the data cannot be decoded.
    private func decodeResponseData<T>(data: Data) throws -> T where T: Decodable {
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            throw HttpClientError.decode
        }
        
        return decodedData
    }
}
