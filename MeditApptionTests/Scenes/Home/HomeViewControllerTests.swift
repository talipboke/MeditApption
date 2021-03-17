//
//  HomeViewControllerTests.swift
//  MeditApptionTests
//
//  Created by Talip Böke on 17.03.2021.
//

import XCTest
@testable import MeditApption

class HomeViewControllerTests: XCTestCase {

    var sut: HomeViewController!
    var mockDelegate: MockHomeViewControllerDelegate!
    
    override func setUp() {
        
        sut = MockAppDependencies().build()
        mockDelegate = MockHomeViewControllerDelegate()
        sut.delegate = mockDelegate
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ShouldCallDidTapCell() {
        //Given
        _ = sut.view
        
        //When
        sut.didTap(story: MockProvider.createBaseModel() as! Story)
        
        //Then
        XCTAssertTrue(mockDelegate.didTapCalled)
    }
}

class MockHomeViewControllerDelegate: HomeViewControllerDelegate {
    
    var didTapCalled: Bool = false
    func homeViewControllerDidTapCell(_ homeViewController: HomeViewController, model: BaseModel) {
        didTapCalled = true
    }
    
    
}
