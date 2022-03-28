//
//  HttpClientRequestParameters.swift
//
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpClientRequestParameters structure.
struct HttpClientRequestParameters: HttpClientRequestParametersProtocol {
    var url: String
    var method: HttpRequestMethod
    var body: [String : String]? = nil
    var query: [String : String]? = nil
    var headers: [HttpRequestHeader]? = [
        .init(key: .accept, value: "application/json"),
        .init(key: .contentType, value: "application/json")
    ]
}

