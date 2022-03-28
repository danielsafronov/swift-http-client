//
//  HttpResponseError.swift
//  
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpResponseError structure.
struct HttpResponseError: Error {
    let data: Data
    let response: URLResponse
}
