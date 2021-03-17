//
//  HomeCoordinator.swift
//  MeditApption
//
//  Created by Talip Böke on 12.03.2021.
//

import UIKit

internal class HomeCoordinator: CoordinatorProtocol {
    typealias Factory = HomeViewControllerBuilder &
                    DetailViewControllerBuilder
    var childCoordinators: [CoordinatorProtocol] = []
    internal var navigationController: UINavigationController
    private let factory: Factory
    
    internal init(navigationController: UINavigationController,
                  factory: Factory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    internal func start() {
        showHomeViewController()
    }
}

private extension HomeCoordinator {
    func showHomeViewController() {
        let homeViewController: HomeViewController = factory.build()
        homeViewController.delegate = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func showDetailViewController(model: BaseModel) {
        let detailViewController: DetailViewController = factory.build(model: model)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    func homeViewControllerDidTapCell(_ homeViewController: HomeViewController, model: BaseModel) {
        showDetailViewController(model: model)
    }
}
