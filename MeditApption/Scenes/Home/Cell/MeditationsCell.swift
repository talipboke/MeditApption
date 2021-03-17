//
//  MeditationsCell.swift
//  MeditApption
//
//  Created by Talip Böke on 15.03.2021.
//

import UIKit

internal protocol MeditationsCellDelegate: class {
    func didTap(meditation: Meditation)
}

internal final class MeditationsCell: UITableViewCell{
    
    internal lazy var titleLabel = UIFactory.createTitleTextLabel(text: AppConstant.meditations, fontSize: 24, alignment: .left)
    internal weak var delegate: MeditationsCellDelegate?

    private lazy var collectionView = UIFactory.createCollectionView(type: UICollectionView.self)
    
    private lazy var meditations: [Meditation] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        layoutViews()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MeditationCollectionCell.self, forCellWithReuseIdentifier: MeditationCollectionCell.reuseIdentifier)
    }
    
    required internal init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    internal func setupUI(model: [Meditation]) {
        meditations = model
        collectionView.reloadData()
    }
}

private extension MeditationsCell {
    func layoutViews() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DimensionConstant.Spacing.large),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
        
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DimensionConstant.Spacing.large),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 280),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension MeditationsCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meditations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MeditationCollectionCell.reuseIdentifier, for: indexPath) as! MeditationCollectionCell
        cell.setupUI(model: meditations[indexPath.row], indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTap(meditation: meditations[indexPath.row])
    }
}
