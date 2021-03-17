//
//  HomeViewController.swift
//  MeditApption
//
//  Created by Talip Böke on 12.03.2021.
//

import UIKit

internal protocol HomeViewControllerDelegate: class {
    func homeViewControllerDidTapCell(_ homeViewController: HomeViewController, model: BaseModel)
}

internal final class HomeViewController: UIViewController {
    
    private(set) internal lazy var homeView = HomeView()
    private let viewModel: HomeViewModel
    internal weak var delegate: HomeViewControllerDelegate?
    
    internal init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    internal required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStoriesAndMeditations()
        
        homeView.tableView.register(MeditationsCell.self, forCellReuseIdentifier: MeditationsCell.reuseIdentifier)
        homeView.tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.reuseIdentifier)
        homeView.tableView.register(StoriesCell.self, forCellReuseIdentifier: StoriesCell.reuseIdentifier)
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
        
        homeView.tableView.rowHeight = UITableView.automaticDimension
        homeView.tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
}

private extension HomeViewController {
    func getStoriesAndMeditations() {
        self.viewModel.getStoriesAndMeditations { [weak self] (response) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.homeView.tableView.reloadData()
            }
        } failure: { (error) in
            print(error)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withClass: MeditationsCell.self, for: indexPath)
            cell.delegate = self
            cell.setupUI(model: self.viewModel.homePageResponse?.meditations ?? [])
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withClass: InfoCell.self, for: indexPath)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withClass: StoriesCell.self, for: indexPath)
            cell.delegate = self
            cell.setupUI(model: self.viewModel.homePageResponse?.stories ?? [])
            return cell
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 40.0
    }
}

extension HomeViewController: MeditationsCellDelegate {
    func didTap(meditation: Meditation) {
        self.delegate?.homeViewControllerDidTapCell(self, model: meditation)
    }
}

extension HomeViewController: StoriesCellDelegate {
    func didTap(story: Story) {
        self.delegate?.homeViewControllerDidTapCell(self, model: story)
    }
    
    func didChangedContentHeight(height: CGFloat) {
        DispatchQueue.main.async {
            self.homeView.tableView.beginUpdates()
            self.homeView.tableView.endUpdates()
        }
    }
}
