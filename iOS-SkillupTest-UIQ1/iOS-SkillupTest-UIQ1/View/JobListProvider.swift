//
//  JobListProvider.swift
//  iOS-SkillupTest-UIQ1
//
//  Created by Jack Wong on 2018/08/18.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import UIKit

struct JobInfo {
    var companyName = ""
    var imageUrl = ""
    var location = ""
    var salary = ""
    var details = ""
}

final class JobListProvider: NSObject {
    var jobInfo = [JobInfo]()
    
    func fetchJobInfoFromDB(fetchedJobInfo: [JobInfo]) {
        self.jobInfo = []
        self.jobInfo = fetchedJobInfo
    }
}

// MARK: - UITableViewDataSource
extension JobListProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JobListCell.identifier, for: indexPath) as? JobListCell else {
            fatalError("no cell")
        }
        cell.companyName = jobInfo[indexPath.row].companyName
        cell.locationName = jobInfo[indexPath.row].location
        cell.imageUrl = jobInfo[indexPath.row].imageUrl
        cell.salary = jobInfo[indexPath.row].salary
        cell.details = jobInfo[indexPath.row].details
        return cell
    }
}


