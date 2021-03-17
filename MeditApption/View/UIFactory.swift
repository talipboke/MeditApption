//
//  UIFactory.swift
//  MeditApption
//
//  Created by Talip Böke on 14.03.2021.
//

import UIKit

internal final class UIFactory {
    
    internal class func createVideoPlayView() -> UIView {
        
        let view = UIView()
        view.backgroundColor = .opaqueBackGroundGray
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Triangle")
        imageView.contentMode = .scaleAspectFit
     
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 21.18).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 26.47).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 90).isActive = true
        view.heightAnchor.constraint(equalToConstant: 90).isActive = true
        view.layer.cornerRadius = 45
        return view
    }
    
    internal class func createTitleTextLabel(text: String = "", fontSize: CGFloat = 32,weight: UIFont.Weight = .bold, alignment: NSTextAlignment = .center, textColor: UIColor = .white) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textColor = textColor
        label.textAlignment = alignment
        return label
    }
    
    internal class func createDetailTextLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .opaque08White
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }
    
    internal class func createOpaqueRoundedTimeLabel() -> UILabel {
        let label = UILabel()
      
        label.heightAnchor.constraint(equalToConstant: 32).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        label.backgroundColor = .opaque015White
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 16
        label.textColor = .opaque07White
        return label
    }
    
    internal class func createTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = .zero
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }
    
    internal class func createPurpleInfoView() -> UIView {
        let view = UIView()
        view.backgroundColor = .infoPurple
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 124).isActive = true
        view.layer.cornerRadius = 8
        
        
        let imageView = UIImageView()
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "night")
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
        ])
    
        let label = UIFactory.createTitleTextLabel(text: AppConstant.internalNotice, fontSize: 15, weight: .regular, alignment: .center, textColor: .white)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: imageView, attribute: .trailing, multiplier: 1.0, constant: 15)
        ])
        return view
    }
    
    internal class func createCollectionView<T:UICollectionView>(type: T.Type, scrollDirection: UICollectionView.ScrollDirection = .horizontal) -> T {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        let cv = T.init(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }
    
    internal class func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8.0
        return image
    }
}
