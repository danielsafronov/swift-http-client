//
//  HttpResponseErrorTransformer.swift
//  
//
//  Created by Daniel Safronov on 29.03.2022.
//

import Foundation

/// HTTP response error transform closure typealias.
public typealias HttpResponseErrorTransformer = (HttpResponseError) -> Error
