//
//  HttpClientRequestBuilderProtocol.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientRequestBuilderProtocol protocol.
public protocol HttpClientRequestBuilderProtocol {
    /// Create a new HttpClientRequestProtocol instance.
    /// - parameter prameters: An instance of HttpClientRequestParameters.
    /// - returns: An instance of HttpClientRequestProtocol.
    /// - throws: If something went wrong.
    func build(with parameters: HttpClientRequestParameters) throws -> HttpClientRequestProtocol
}
