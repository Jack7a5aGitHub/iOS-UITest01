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
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dbDao.fetchData()
    }

}
