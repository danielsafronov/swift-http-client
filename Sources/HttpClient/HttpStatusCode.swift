//
//  HttpStatusCode.swift
//  
//
//  Created by Daniel Safronov on 28.03.2022.
//

import Foundation

/// HttpStatusCode enumeration.
public enum HttpStatusCode: Int {
    /// 2xx :
    case ok = 200
    case created = 201
    case accepted = 202
    
    /// 4xx :
    case badRequest = 400
    case unauthorized = 401
    case forbbiden = 403
    case notFound = 404
    case unprocessableEntity = 422
    
    /// 5xx :
    case internalServerError = 500
    case notImplemented = 501
    case badGetway = 502
    case serviceUnavailable = 503
    case getwayTimeout = 504
}

extension HttpStatusCode {
    public var isSuccess: Bool {
        let successCodes = 200...299
        return successCodes.contains(self.rawValue)
    }
}
