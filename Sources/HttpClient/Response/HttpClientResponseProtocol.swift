//
//  File.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientResponseProtocol protocol.
public protocol HttpClientResponseProtocol {
    var data: Data { get }
    var urlResponse: URLResponse { get }
}
