//
//  HomeView.swift
//  MeditApption
//
//  Created by Talip Böke on 15.03.2021.
//

import UIKit

internal final class HomeView: UIView {
    
    internal lazy var tableView = UIFactory.createTableView()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        layoutViews()
    }
    
    internal required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}

private extension HomeView {
    func layoutViews() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
