//
//  HttpClientRequestParameters.swift
//
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpClientRequestParameters structure.
public struct HttpClientRequestParameters: HttpClientRequestParametersProtocol {
    public var url: String
    public var method: HttpRequestMethod
    public var body: [String : String]? = nil
    public var query: [String : String]? = nil
    public var headers: [HttpRequestHeader]? = [
        .init(key: .accept, value: "application/json"),
        .init(key: .contentType, value: "application/json")
    ]
}

