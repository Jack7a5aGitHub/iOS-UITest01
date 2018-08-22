//
//  MainViewController.swift
//  iOS-SkillupTest-UIQ1
//
//  Created by Jack Wong on 2018/08/18.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import UIKit

@objc
protocol MainViewControllerDelegate {
    @objc optional func toggleLeftPanel()
    @objc optional func collapseSidePanels()
}

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let dbDao = DataBaseDao()
    private let jobListProvider = JobListProvider()
    
    var delegate: MainViewControllerDelegate?
    // MARK: - IBOutlet
    @IBOutlet weak var jobListTableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    // MARK: - IBAction
    @IBAction func menuButtonTapped(_ sender: Any) {
        delegate?.toggleLeftPanel?()
    }
    
}

// MARK: - Private func
extension MainViewController {
    private func setupTableView() {
        jobListTableView.delegate = self
        jobListTableView.dataSource = jobListProvider
        jobListProvider.fetchJobInfoFromDB(fetchedJobInfo: dbDao.fetchData())
        jobListTableView.reloadData()
    }
    
}

extension MainViewController: LeftPanelViewControllerDelegate {
    func didSelectQuery() {
        print("left panel")
        delegate?.collapseSidePanels?()
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
