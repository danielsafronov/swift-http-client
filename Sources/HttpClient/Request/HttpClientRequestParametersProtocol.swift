//
//  HttpClientRequestParametersProtocol.swift
//  
//
//  Created by Daniel Safronov on 09.04.2022.
//

import Foundation

/// HttpClientRequestParametersProtocol protocol.
public protocol HttpClientRequestParametersProtocol {
    var url: String { get }
    var method: HttpRequestMethod { get }
    var bodyParameters: HttpClientRequestBodyParameters { get }
    var queryParameters: HttpClientRequestQueryParameters { get }
    var headers: HttpClientRequestHeaders { get }
}
