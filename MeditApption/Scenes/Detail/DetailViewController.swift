//
//  DetailViewController.swift
//  MeditApption
//
//  Created by Talip Böke on 14.03.2021.
//

import UIKit


internal final class DetailViewController: UIViewController {
    
    private(set) internal lazy var detailView = DetailView()
    private let viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    internal required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.renderUI(detailView: detailView)
    }
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
}
