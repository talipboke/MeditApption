//
//  MockURLProtocol.swift
//  MeditApptionTests
//
//  Created by Talip Böke on 15.03.2021.
//

import Foundation
@testable import MeditApption

class MockURLProtocol : URLProtocol {
    
    static var stubResponseData : Data?
    static var error : Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        if let signupError = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: signupError)
        }else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data.init())
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    override func stopLoading() {}
}
