//
//  MainViewController.swift
//  iOS-SkillupTest-UIQ1
//
//  Created by Jack Wong on 2018/08/18.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let dbDao = DataBaseDao()
    private let jobListProvider = JobListProvider()
    // MARK: - IBOutlet
    @IBOutlet weak var jobListTableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
