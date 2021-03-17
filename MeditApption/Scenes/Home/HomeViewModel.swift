//
//  HomeViewModel.swift
//  MeditApption
//
//  Created by Talip Böke on 15.03.2021.
//

import Foundation

internal class HomeViewModel {
    private let apiClient: APIClientProtocol
    internal var homePageResponse: HomePageResponse?
    
    internal init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getStoriesAndMeditations(success: @escaping (HomePageResponse) -> (),
                             failure: @escaping (APIError) -> ()) {
        
        apiClient.request(route: .getHomePage, responseType: HomePageResponse.self) { [weak self] (response) in
            guard let self = self else {return}
            self.homePageResponse = response
            success(response)
        } failure: { (error) in
            failure(error)
        }
    }
}
