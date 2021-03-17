//
//  MockAppDependencies.swift
//  MeditApptionTests
//
//  Created by Talip Böke on 13.03.2021.
//

import UIKit
@testable import MeditApption

class MockAppDependencies: ConsumableDependencyFactoryProtocol,CoordinatorFactoryProtocol {
    func makeAPIClient() -> APIClientProtocol {
        
        return APIClient.init(urlSession: MockProvider.createMockURLSession())
    }
    
    internal func makeAppCoordinator(_ navigationController: UINavigationController) -> AppCoordinator {
        return AppCoordinator(navigationController: navigationController,
                              factory: self)
    }
    
    internal func makeHomeCoodinator(_ navigationController: UINavigationController) -> HomeCoordinator {
        return HomeCoordinator(navigationController: navigationController,
                               factory: self)
    }
    
    
}

extension MockAppDependencies: HomeViewControllerBuilder {
    func build() -> HomeViewController {
        let viewModel = HomeViewModel(apiClient: makeAPIClient())
        return HomeViewController(viewModel: viewModel)
    }
}

extension MockAppDependencies: DetailViewControllerBuilder {
    func build(model: BaseModel) -> DetailViewController {
        let viewModel = DetailViewModel(model: model)
        return DetailViewController(viewModel: viewModel)
    }
}

