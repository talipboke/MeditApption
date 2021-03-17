//
//  MockProvider.swift
//  MeditApptionTests
//
//  Created by Talip Böke on 15.03.2021.
//

import UIKit
@testable import MeditApption

internal struct MockProvider {
    internal static func createMockURLSession() -> URLSession {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        return URLSession.init(configuration: config)
    }
    
    internal static func createRouteWindowAndMakeVisible(_ navigationController: UINavigationController) {
        let window = UIWindow(frame: .zero)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    internal static func createBaseModel() -> BaseModel {
        return BaseModel.init(title: "title",
                              subtitle: "subtitle",
                              releaseDate: "release date",
                              content: "content",
                              image: Image.init(small: "small", large: "large"))
    }
    

    internal static func createStory() -> Story {
        return Story.init(title: "title",
                              subtitle: "subtitle",
                              releaseDate: "release date",
                              content: "content",
                              image: Image.init(small: "small", large: "large"))
    }
}
