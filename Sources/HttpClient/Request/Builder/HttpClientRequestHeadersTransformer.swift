//
//  File.swift
//  
//
//  Created by Daniel Safronov on 30.03.2022.
//

import Foundation

/// Request headers transform closure typealias.
public typealias HttpClientRequestHeadersTransformer = (HttpClientRequestHeaders) -> HttpClientRequestHeaders
