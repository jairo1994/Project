//
//  TabbarViewController.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit
import Presentr
import IQKeyboardManagerSwift

class TabbarViewController: UITabBarController {
    static var _shared : TabbarViewController!
    static var shared : TabbarViewController{
        return _shared
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TabbarViewController._shared = self
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        
        UserDefaults.setUserInfo(UserModel())
        UserDefaults.setIsUserRegistered(.login)
        // Do any additional setup after loading the view.
    }
    
    func showModalNeedLoginView(){
        let guestLoginViewController = MainLoginViewController()
        let height: Float = Float(self.view.frame.height)
        let widthsize: Float = Float(self.view.frame.width)
        
        let presenter: Presentr = {
            let width = ModalSize.customOrientation(sizePortrait: widthsize , sizeLandscape: height)
            let height = ModalSize.customOrientation(sizePortrait: height, sizeLandscape: widthsize)
            let center = ModalCenterPosition.center
            let customType = PresentationType.custom(width: width, height: height, center: center)
            
            let customPresenter = Presentr(presentationType: customType)
            customPresenter.transitionType = .coverVerticalFromTop
            customPresenter.dismissTransitionType = .coverVerticalFromTop
            customPresenter.roundCorners = true
            customPresenter.blurBackground = true
            customPresenter.blurStyle = UIBlurEffect.Style.dark
            customPresenter.dismissOnSwipe = false
            customPresenter.outsideContextTap = .noAction
            
            return customPresenter
        }()
        customPresentViewController(presenter, viewController: guestLoginViewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
