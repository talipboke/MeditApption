//
//  HomeViewModelTests.swift
//  MeditApptionTests
//
//  Created by Talip Böke on 15.03.2021.
//

import XCTest
@testable import MeditApption

class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!

    override func setUp() {
        super.setUp()
        
        sut = HomeViewModel.init(apiClient: MockAppDependencies().makeAPIClient())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ShouldGetMoviesAndStories() {
        //Given
        let data = StubFile.HomePageResponse.stubbedResponse()
        MockURLProtocol.error = nil
        MockURLProtocol.stubResponseData = data
        let expectedResponse = try! JSONDecoder().decode(HomePageResponse.self, from: data)
        let getExpectation = expectation(description: "Get Expectation")
        //getExpectation.assertForOverFulfill = false
        //When
        sut.getStoriesAndMeditations { (response) in
            XCTAssertEqual(response, expectedResponse)
            getExpectation.fulfill()
        } failure: { (error) in
            getExpectation.fulfill()
        }
        
        wait(for: [getExpectation], timeout: 1.0)
    }
    
//    func test_ShouldReturnFetchError() {
//        //Given
//        let givenError: APIError = .failedRequest(description: "Network Error")
//        MockURLProtocol.error = givenError
//        MockURLProtocol.stubResponseData = nil
//        
//        let failureExpectation = expectation(description: "Failure Expectation")
//    
//        //failureExpectation.assertForOverFulfill = false
//        //When
//        sut.getStoriesAndMeditations { (response) in
//            failureExpectation.fulfill()
//        } failure: { (error) in
//            XCTAssertEqual(error.errorDescription, givenError.errorDescription)
//            failureExpectation.fulfill()
//        }
//
//        wait(for: [failureExpectation], timeout: 1.0)
//    }
}
