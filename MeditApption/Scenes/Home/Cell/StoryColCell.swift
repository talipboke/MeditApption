//
//  StoryColCell.swift
//  MeditApption
//
//  Created by Talip Böke on 16.03.2021.
//

import UIKit

internal final class StoryColCell: UICollectionViewCell {
    
    internal lazy var imageView = UIFactory.makeImageView()
    internal lazy var upperLabel = UIFactory.createTitleTextLabel(fontSize: 16.0, weight: .regular, alignment: .left)
    internal lazy var bottomLabel = UIFactory.createTitleTextLabel(fontSize: 14.0, weight: .regular, alignment: .left, textColor: .opaque07White)
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        layoutViews()
    }
    
    internal required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    internal func setupUI(model: Story, indexPath: IndexPath) {
        upperLabel.text = model.title
        bottomLabel.text = model.subtitle
        
        if let url = URL.init(string: model.image.small) {
            imageView.load(url: url)
        }
    }
}

private extension StoryColCell {
    func layoutViews() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 156),
            imageView.widthAnchor.constraint(equalToConstant: 156)
        ])
        
        contentView.addSubview(upperLabel)
        upperLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            upperLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor)
        ])
        
        contentView.addSubview(bottomLabel)
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            bottomLabel.leadingAnchor.constraint(equalTo: upperLabel.leadingAnchor)
        ])
    }
}
