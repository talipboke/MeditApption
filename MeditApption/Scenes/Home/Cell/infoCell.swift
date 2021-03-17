//
//  infoCell.swift
//  MeditApption
//
//  Created by Talip Böke on 15.03.2021.
//

import UIKit

internal final class InfoCell: UITableViewCell {
    
    internal lazy var infoView = UIFactory.createPurpleInfoView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        layoutViews()
    }
    
    required internal init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension InfoCell {
    func layoutViews() {
        
        addSubview(infoView)
        
        NSLayoutConstraint.activate([
            infoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DimensionConstant.Spacing.large),
            infoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DimensionConstant.Spacing.large),
            infoView.topAnchor.constraint(equalTo: topAnchor),
            infoView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}


