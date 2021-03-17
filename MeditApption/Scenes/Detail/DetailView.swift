//
//  DetailView.swift
//  MeditApption
//
//  Created by Talip Böke on 14.03.2021.
//

import UIKit

internal final class DetailView: UIView {
    
    internal lazy var videoPlayView = UIFactory.createVideoPlayView()
    internal lazy var titleLabel = UIFactory.createTitleTextLabel()
    internal lazy var detailLabel = UIFactory.createDetailTextLabel()
    internal lazy var timeLabel = UIFactory.createOpaqueRoundedTimeLabel()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        layoutViews()
    }
    
    internal required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}

private extension DetailView {
    func layoutViews() {
        addSubview(videoPlayView)
    
        NSLayoutConstraint.activate ([
            videoPlayView.centerXAnchor.constraint(equalTo: centerXAnchor),
            NSLayoutConstraint.init(item: videoPlayView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 0.5, constant: 0)
        ])
        

        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: videoPlayView.bottomAnchor, constant: DimensionConstant.Spacing.xlarge),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DimensionConstant.Spacing.large),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DimensionConstant.Spacing.large)
        ])
        
    
        addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DimensionConstant.Spacing.xlarge),
            detailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
        
        addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: DimensionConstant.Spacing.xlarge)
        ])
    }
}
