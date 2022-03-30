//
//  HttpClientResponseHandlerBuilderProtocol.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientResponseHandlerBuilderProtocol protocol.
public protocol HttpClientResponseHandlerBuilderProtocol {
    /// Create a new HttpClientResponseHandlerProtocol instance.
    /// - returns: An instance of HttpClientResponseHandlerProtocol.
    func build() -> HttpClientResponseHandlerProtocol
}
