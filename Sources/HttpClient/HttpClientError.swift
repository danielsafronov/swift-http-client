//
//  HttpClientError.swift
//
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpClientError enumeration.
public enum HttpClientError: Error {
    case invalidURL
    case invalidResponse
    case decode
    case unexpected
    case unsupportedStatusCode
}
