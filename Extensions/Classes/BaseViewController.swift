//
//  UIViewController.swift
//  PSS
//
//  Created by jinbo on 2017/7/20.
//  Copyright © 2017年 mi. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    @IBOutlet weak var navigationView: NavigationView!
    var isLoad = false
    var forbidLeftSwipe = false // 禁止左滑， 默认NO
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        modalPresentationStyle = .fullScreen
        hidesBottomBarWhenPushed = true
    }
    
    var baseNav: UINavigationController {
       return self.navigationController ?? UINavigationController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoad = true
        
        if navigationController != nil {
            self.navigationView?.height?.constant = navigationHeight
        } else {
            self.navigationView?.height?.constant = (modalPresentationStyle == .fullScreen ? navigationHeight : 44)
        }
        if let array = navigationController?.viewControllers, array.count > 1 {
            navigationView?.setLeftButtonImage(NavBlackImage, target: self, action: #selector(defaultBackAction))
        }
    }
    
    @objc func defaultBackAction() {
        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func backRootAction() {
        if let nav = navigationController {
            nav.popToRootViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
}

class BaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
        interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer != interactivePopGestureRecognizer {
            return true
        }
        if viewControllers.count <= 1 {
            return false
        }
        let topVC = topViewController
        let childVCArr = topVC?.children ?? []
        for vc in childVCArr {
            if (vc is UINavigationController) {
                continue
            }
            if let vc = vc as? BaseViewController {
                let forbid = vc.forbidLeftSwipe
                if forbid {
                    return false
                }
            }
        }
        
        if let topVC = topVC as? BaseViewController {
            return !topVC.forbidLeftSwipe
        }
        return true
    }
}
