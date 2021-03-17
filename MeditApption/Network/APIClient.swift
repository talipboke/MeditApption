//
//  APIClient.swift
//  MeditApption
//
//  Created by Talip Böke on 15.03.2021.
//

import Foundation

internal protocol APIClientProtocol {
    func request<T: Decodable>(route: APIRouter, responseType: T.Type, success: @escaping (T) -> (), failure: @escaping (APIError) -> ())
}

internal final class APIClient: APIClientProtocol {
    
    private let urlSession: URLSession
    
    internal init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func request<T: Decodable>(route: APIRouter,
                               responseType: T.Type,
                               success: @escaping (T) -> (),
                               failure: @escaping (APIError) -> ())
    {
        
        guard let url = URL.init(string: route.urlString) else {return failure(.urlError)}
    
        var request = URLRequest.init(url: url)
        request.httpMethod = route.method.rawValue
       
        urlSession.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    failure(APIError.failedRequest(description: error?.localizedDescription))
                }
            }
            
            if let safeData = data {
                do {
                    let responseModel = try JSONDecoder().decode(T.self, from: safeData)
                    DispatchQueue.main.async {
                        success(responseModel)
                    }
                }catch {
                    DispatchQueue.main.async {
                        failure(.invalidResponseModel)
                    }
                }
            }else {
                DispatchQueue.main.async {
                    failure(.invalidResponseModel)
                }
            }
        }.resume()
    }
}

enum APIError: Error {
    case invalidResponseModel
    case failedRequest(description: String?)
    case urlError
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel,.urlError:
            return ""
        }
    }
    
}
