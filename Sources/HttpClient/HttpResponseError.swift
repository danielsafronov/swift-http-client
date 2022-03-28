//
//  HttpResponseError.swift
//  
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpResponseError structure.
public struct HttpResponseError: Error {
    public let data: Data
    public let response: URLResponse
}
