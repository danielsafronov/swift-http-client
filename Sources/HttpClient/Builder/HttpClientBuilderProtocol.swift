//
//  HttpClientBuilderProtocol.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientBuilderProtocol protocol.
public protocol HttpClientBuilderProtocol {
    /// Create a new HttpClientProtocol instance.
    /// - returns: An instance of HttpClientProtocol.
    func build() -> HttpClientProtocol
}
