//
//  AppDependencies.swift
//  MeditApption
//
//  Created by Talip Böke on 12.03.2021.
//

import UIKit

internal struct AppDependencies {}

internal protocol ConsumableDependencyFactoryProtocol {
    func makeAPIClient() -> APIClientProtocol
}

extension AppDependencies: ConsumableDependencyFactoryProtocol {
    func makeAPIClient() -> APIClientProtocol{
        return APIClient()
    }
}

internal protocol CoordinatorFactoryProtocol {
    func makeAppCoordinator(_ navigationController: UINavigationController) -> AppCoordinator
    func makeHomeCoodinator(_ navigationController: UINavigationController) -> HomeCoordinator
}

extension AppDependencies: CoordinatorFactoryProtocol {
    internal func makeAppCoordinator(_ navigationController: UINavigationController) -> AppCoordinator {
        return AppCoordinator(navigationController: navigationController,
                              factory: self)
    }
    
    internal func makeHomeCoodinator(_ navigationController: UINavigationController) -> HomeCoordinator {
        return HomeCoordinator(navigationController: navigationController,
                               factory: self)
    }
}

