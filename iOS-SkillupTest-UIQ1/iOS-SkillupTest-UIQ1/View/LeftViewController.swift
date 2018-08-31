//
//  LeftViewController.swift
//  iOS-SkillupTest-UIQ1
//
//  Created by Jack Wong on 2018/08/19.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import UIKit

protocol LeftPanelViewControllerDelegate {
    func queueFromTheLatest()
    func queueFromTheEnd()
}

class LeftViewController: UITableViewController {
    
    // MARK: Properties
    private var centerViewController: MainViewController!
    var leftDelegate: LeftPanelViewControllerDelegate?
    let centerPanelExpandedOffset: CGFloat = 60
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
        queryTableView.delegate = self
        queryTableView.tableFooterView = UIView()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Tapped", indexPath.row)
        if indexPath.row == 0 {
           leftDelegate?.queueFromTheLatest()
        } else {
           leftDelegate?.queueFromTheEnd()
        }
    }
}

