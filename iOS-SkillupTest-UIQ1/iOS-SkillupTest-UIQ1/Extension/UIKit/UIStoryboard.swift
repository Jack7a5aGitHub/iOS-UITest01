//
//  UIStoryboard.swift
//  iOS-SkillupTest-UIQ1
//
//  Created by Jack Wong on 2018/08/25.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func main() -> UIStoryboard { return UIStoryboard(name: "MainViewController", bundle: Bundle.main) }
    
    static func leftViewController() -> LeftViewController? {
        return UIStoryboard(name: "LeftViewController", bundle: nil).instantiateViewController(withIdentifier: "LeftViewController") as? LeftViewController
    }
    
    static func centerViewController() -> MainViewController? {
        return main().instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
    }
}
