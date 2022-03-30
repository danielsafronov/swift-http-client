//
//  HttpClientRequestProtocol.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientRequestProtocol protocol.
public protocol HttpClientRequestProtocol {
    var urlRequest: URLRequest { get }
}
