//
//  File.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HttpClientResponse sturcture.
internal struct HttpClientResponse: HttpClientResponseProtocol {
    let data: Data
    let urlResponse: URLResponse
}
