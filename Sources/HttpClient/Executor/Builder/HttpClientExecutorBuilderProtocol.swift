//
//  HttpClientExecutorBuilderProtocol.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientExecutorBuilderProtocol protocol.
public protocol HttpClientExecutorBuilderProtocol {
    /// Create a new HttpClientExecutorProtocol instance.
    /// - returns: An instance of HttpClientExecutorProtocol.
    func build() -> HttpClientExecutorProtocol
}
