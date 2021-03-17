//
//  DetailViewModel.swift
//  MeditApption
//
//  Created by Talip Böke on 17.03.2021.
//

import Foundation

internal class DetailViewModel {
    
    private let model: BaseModel
    
    init(model: BaseModel) {
        self.model = model
    }
    
    internal func renderUI(detailView: DetailView) {
        detailView.titleLabel.text = model.title
        detailView.detailLabel.text = model.content
        detailView.timeLabel.text = model.releaseDate
    }
}
