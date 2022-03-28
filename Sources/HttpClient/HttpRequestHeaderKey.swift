//
//  HttpRequestHeaderKey.swift
//  
//
//  Created by Daniel Safronov on 27.03.2022.
//

import Foundation

/// HttpRequestHeaderKey enumeration.
enum HttpRequestHeaderKey: String {
    case authorization = "Authorization"
    case contentType = "Content-Type"
    case accept = "Accept"
    case xDevice = "X-Device"
}
