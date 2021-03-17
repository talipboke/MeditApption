//
//  HomeViewControllerBuilder.swift
//  MeditApption
//
//  Created by Talip Böke on 12.03.2021.
//

import Foundation

internal protocol HomeViewControllerBuilder {
    func build() -> HomeViewController
}

extension AppDependencies: HomeViewControllerBuilder {
    func build() -> HomeViewController {
        let viewModel = HomeViewModel(apiClient: makeAPIClient())
        return HomeViewController(viewModel: viewModel)
    }
}
