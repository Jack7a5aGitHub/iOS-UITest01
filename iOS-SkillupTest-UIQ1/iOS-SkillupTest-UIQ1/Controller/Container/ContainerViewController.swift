//
//  ContainerViewController.swift
//  iOS-SkillupTest-UIQ1
//
//  Created by Jack Wong on 2018/08/24.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import UIKit

enum SlideOutState {
    case bothCollapsed
    case leftPanelExpanded
    case rightPlanelExpanded
}

final class ContainerViewController: UIViewController {

    // MARK: - Properties
    private var centerNavigtionController: UINavigationController!
    private var centerViewController: MainViewController!
    private var currentState: SlideOutState = .bothCollapsed {
        didSet{
            let shouldShowShadow = currentState != .bothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    private var leftViewController: LeftViewController?
    
    let centerPanelExpandedOffset: CGFloat = 60
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        centerViewController = UIStoryboard.centerViewController()
        centerViewController.delegate = self
        centerNavigtionController = UINavigationController(rootViewController: centerViewController)
        addChildViewController(centerNavigtionController)
        centerNavigtionController.didMove(toParentViewController: self)
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        centerNavigtionController.view.addGestureRecognizer(panGestureRecognizer)
    }
}

// MARK: - CenterViewController delegate
extension ContainerViewController: MainViewControllerDelegate {
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        animateLeftPanel(shouldEXpand: notAlreadyExpanded)
    }
    func collapseSidePanels() {
        
    }
    
    func addLeftPanelViewController() {
        guard leftViewController == nil else { return }
        
        if let vc = UIStoryboard.leftViewController() {
            addChildViewController(vc)
            leftViewController = vc
        }
    }
    func addChildSidePanelController(_ sidePanelController: LeftViewController) {
        sidePanelController.delegate = centerViewController
        view.insertSubview(sidePanelController.view, at: 0)
        addChildViewController(sidePanelController)
        sidePanelController.didMove(toParentViewController: self)
    }
    func animateLeftPanel(shouldExpand: Bool) {
        if shouldExpand {
            currentState = .leftPanelExpanded
            
        }
    }
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
        
    }
}

// MARK: - Gesture recognizer
extension ContainerViewController: UIGestureRecognizerDelegate {
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: view).x > 0)
        
        switch recognizer.state {
        case .began:
            if currentState == .bothCollapsed {
                if gestureIsDraggingFromLeftToRight {
                    addLeftPanelViewController()
                }
                showShadoeForCenterViewController(true)
            }
        case .changed:
            if let recognizeView = recognizer.view {
                recognizeView.center.x = recognizeView.center.x + recognizer.translation(in: view).x
                recognizer.setTranslation(CGPoint.zero, in: view)
            }
        case .ended:
           if let recognizeView = recognizer.view {
                let hasMovedGreaterThanHalfWay = recognizeView.center.x > view.bounds.size.width
            animaterLeftPanel(shouldExpand: hasMovedGreaterThanHalfWay)
            }
        default:
            break
        }
    }
}
private extension UIStoryboard {
    
    static func main() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    
    static func leftViewController() -> LeftViewController? {
        return main().instantiateViewController(withIdentifier: "LeftViewController") as? LeftViewController
    }
    
    static func centerViewController() -> MainViewController? {
        return main().instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
    }
}
