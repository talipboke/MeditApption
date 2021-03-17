//
//  APIRouter.swift
//  MeditApption
//
//  Created by Talip Böke on 17.03.2021.
//

import Foundation



internal protocol APIConfiguration {
    var method: HTTPMethod {get}
    var urlString: String {get}
}

enum HTTPMethod: String {
    case get = "GET"
}

enum APIRouter: APIConfiguration {
    
    case getHomePage

    var method: HTTPMethod {
        switch self {
        case .getHomePage:
            return .get
        }
    }
    
    var urlString: String {
        switch self {
        case .getHomePage:
            return "https://jsonblob.com/api/jsonBlob/a07152f5-775c-11eb-a533-c90b9d55001f"
        }
    }
}
