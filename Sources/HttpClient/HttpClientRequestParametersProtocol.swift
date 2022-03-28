//
//  HttpClientRequestParameters.swift
//  
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpClientRequestParametersProtocol protocol.
protocol HttpClientRequestParametersProtocol {
    var url: String { get }
    var method: HttpRequestMethod { get }
    var body: [String: String]? { get set }
    var query: [String: String]? { get set }
    var headers: [HttpRequestHeader]? { get set }
}

extension HttpClientRequestParametersProtocol {
    public mutating func withHeader(_ header: HttpRequestHeader) {
        if var headers = headers {
            headers.append(header)
            self.headers = headers
        } else {
            headers = [header]
        }
    }
}
