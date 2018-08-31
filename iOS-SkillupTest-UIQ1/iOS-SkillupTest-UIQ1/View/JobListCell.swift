//
//  JobListCell.swift
//  iOS-SkillupTest-UIQ1
//
//  Created by Jack Wong on 2018/08/18.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import UIKit
import Kingfisher

final class JobListCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var jobImageView: UIImageView!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var salaryImageView: UIImageView!
    @IBOutlet weak var salaryLabel: UILabel!
    var startDate = ""
    var endDate = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        locationImageView.image = #imageLiteral(resourceName: "icon_location")
        salaryImageView.image = #imageLiteral(resourceName: "icon_yen")
    }
    
    static var identifier: String {
        return self.className
    }
    
    var companyName: String? {
        didSet {
            companyNameLabel.text = companyName
        }
    }
    var imageUrl: String? {
        didSet{
            guard let image = imageUrl,
                let url = URL(string: image) else {
                    return
            }
                jobImageView?.kf.setImage(with: url)
            
        }
    }
    var locationName: String? {
        didSet {
            locationLabel.text = locationName
        }
    }
    var salary: String? {
        didSet {
            salaryLabel.text = salary
        }
    }
    var details: String? {
        didSet{
            detailsLabel.text = details
        }
    }
}
