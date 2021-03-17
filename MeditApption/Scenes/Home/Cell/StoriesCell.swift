//
//  StoriesCell.swift
//  MeditApption
//
//  Created by Talip Böke on 16.03.2021.
//

import UIKit

internal protocol StoriesCellDelegate: class {
    func didTap(story: Story)
    func didChangedContentHeight(height: CGFloat)
}

internal final class StoriesCell: UITableViewCell {
    
    internal lazy var titleLabel = UIFactory.createTitleTextLabel(text: AppConstant.stories, fontSize: DimensionConstant.Spacing.large, alignment: .left)
    internal lazy var collectionView = UIFactory.createCollectionView(type: DynamicHeightCollectionView.self, scrollDirection: .vertical)
   
    internal weak var delegate: StoriesCellDelegate?
    private lazy var stories: [Story] = []
    internal var collectionViewHeightConstraint: NSLayoutConstraint?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        layoutViews()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(StoryColCell.self, forCellWithReuseIdentifier: StoryColCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets.init(top: 0, left: DimensionConstant.Spacing.large, bottom: 0, right: DimensionConstant.Spacing.large)
        
        collectionView.didContentSizeChanged = { [weak self] height in
            guard let self = self else {return}
            self.collectionViewHeightConstraint?.constant = height
            self.delegate?.didChangedContentHeight(height: height)
        }
    }
    
    required internal init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    internal func setupUI(model: [Story]) {
        stories = model
        collectionView.reloadData()
    }
}

private extension StoriesCell {
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
        
        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
        collectionViewHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension StoriesCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 156, height: 209)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryColCell.reuseIdentifier, for: indexPath) as! StoryColCell
        cell.setupUI(model: stories[indexPath.row], indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didTap(story: stories[indexPath.row])
    }
}

