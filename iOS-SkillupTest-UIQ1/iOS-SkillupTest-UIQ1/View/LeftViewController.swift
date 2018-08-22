//
//  LeftViewController.swift
//  iOS-SkillupTest-UIQ1
//
//  Created by Jack Wong on 2018/08/19.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import UIKit

protocol LeftPanelViewControllerDelegate {
    func didSelectQuery()
}

class LeftViewController: UITableViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var queryTableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

}

// MARK: - Private func
extension LeftViewController {
    private func setupTableView() {
        queryTableView.tableFooterView = UIView()
        queryTableView.delegate = self
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Tapped")
    }
}
