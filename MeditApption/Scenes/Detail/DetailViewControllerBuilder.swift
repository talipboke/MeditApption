//
//  DetailViewControllerBuilder.swift
//  MeditApption
//
//  Created by Talip Böke on 14.03.2021.
//

import Foundation

internal protocol DetailViewControllerBuilder {
    func build(model: BaseModel) -> DetailViewController
}

extension AppDependencies: DetailViewControllerBuilder {
    func build(model: BaseModel) -> DetailViewController {
        let viewModel = DetailViewModel.init(model: model)
        return DetailViewController.init(viewModel: viewModel)
    }
}
